//
//  LoginViewModel.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 19/2/25.
//

import Foundation
import AuthenticationServices

/// `LoginViewModel` gestiona la autenticación con TMDb y la actualización del estado en la UI.
@Observable
final class LoginViewModel {
	
	var isAuthenticating: Bool = false
	var errorMessage: String = ""
	var isLoggedIn: Bool = false
	
	private let authRepository: AuthenticationRepositoryProtocol
	
	init(authRepository: AuthenticationRepositoryProtocol = AuthenticationRepository()) {
		self.authRepository = authRepository
	}
	
	/// Inicia el proceso de autenticación con TMDb.
	@MainActor
	func login() async {
		isAuthenticating = true
		do {
			let tokenResponse = try await authRepository.requestToken()
			let isAuthorized = try await authenticateUser(with: tokenResponse.requestToken)
			
			if isAuthorized {
				let sessionResponse = try await authRepository.createSession(requestToken: tokenResponse.requestToken)
				storeSession(sessionResponse.sessionId)
			} else {
				throw NetworkError.dataNotValid
			}
		} catch {
			handleError(error)
		}
	}
	
	
	/// Autentica el `request_token` redirigiendo al usuario a la web de TMDb.
	@MainActor
	private func authenticateUser(with token: String) async throws -> Bool {
		guard let authURL = URL(string: "https://www.themoviedb.org/authenticate/\(token)") else {
			throw NetworkError.dataNotValid
		}
		
		return try await withCheckedThrowingContinuation { continuation in
			let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: nil) { callbackURL, error in
				if let error {
					continuation.resume(throwing: error)
				} else {
					continuation.resume(returning: true) // El usuario autorizó el request_token
				}
			}
			
			if let rootVC = UIApplication.shared.connectedScenes
				.compactMap({ $0 as? UIWindowScene })
				.first?.windows.first?.rootViewController {
				session.presentationContextProvider = rootVC as? ASWebAuthenticationPresentationContextProviding
			}
			
			session.start()
		}
	}
	
	/// Inicia sesión como invitado solicitando un `guest_session_id`.
	@MainActor
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
	@MainActor
	private func storeSession(_ sessionID: String) {
		isAuthenticating = false
		isLoggedIn = true
		print("Session saved: \(sessionID)") // Más adelante lo almacenaremos en Keychain.
	}
	
	/// Manejo de errores en la autenticación.
	@MainActor
	private func handleError(_ error: Error) {
		isAuthenticating = false
		errorMessage = error.localizedDescription
	}
	
}
