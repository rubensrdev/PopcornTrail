import Foundation

/// `LoginViewModel` gestiona la autenticación con TMDb y la actualización del estado en la UI.
@Observable @MainActor
final class LoginViewModel {
	
	var isAuthenticating = false
	var errorMessage = ""
	var isLoggedIn = false
	
	let sessionIDKey = "TMDbSessionID"
	
	private let authRepository: AuthenticationRepositoryProtocol
	private let webAuthManager = WebAuthManager()
	
	
	init(authRepository: AuthenticationRepositoryProtocol = AuthenticationRepository()) {
		self.authRepository = authRepository
		checkForSavedSession()
	}
	
	private func checkForSavedSession() {
		if let _ = KeychainManager.retrieve(forKey: sessionIDKey) {
			isLoggedIn = true
		}
	}
	
	/// Inicia el proceso de autenticación con TMDb.
	func login() async {
		isAuthenticating = true
		do {
			let tokenResponse = try await authRepository.requestToken()
			
			guard try await authenticateUser(with: tokenResponse.requestToken) else {
				isAuthenticating = false
				return
			}
			
			let sessionResponse = try await authRepository.createSession(requestToken: tokenResponse.requestToken)
			storeSession(sessionResponse.sessionId)
		} catch {
			handleError(error)
		}
	}
	
	/// Autentica el `request_token` redirigiendo al usuario a la web de TMDb.
	private func authenticateUser(with token: String) async throws -> Bool {
		try await withCheckedThrowingContinuation { continuation in
			webAuthManager.authenticateUser(with: token) { success in
				continuation.resume(returning: success)
			}
		}
	}
	
	/// Inicia sesión como invitado solicitando un `guest_session_id`.
	func loginAsGuest() async {
		isAuthenticating = true
		do {
			let guestSessionResponse = try await authRepository.createGuestSession()
			storeSession(guestSessionResponse.guestSessionId)
		} catch {
			handleError(error)
		}
	}
	
	/// Guarda el `session_id` y actualiza el estado de la sesión.
	private func storeSession(_ sessionID: String) {
		isAuthenticating = false
		isLoggedIn = true
		KeychainManager.save(sessionID, forKey: sessionIDKey)
	}
	
	/// Manejo de errores en la autenticación.
	private func handleError(_ error: Error) {
		isAuthenticating = false
		errorMessage = error.localizedDescription
	}
	
	func logout() {
		KeychainManager.delete(forKey: sessionIDKey)
		isLoggedIn = false
	}
}
