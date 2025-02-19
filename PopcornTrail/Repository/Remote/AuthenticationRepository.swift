//
//  AuthenticationRepository.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 19/2/25.
//

import Foundation

/// Este protocolo define las operaciones de autenticación con TMDb
protocol AuthenticationRepositoryProtocol: Sendable {
	/// Solicita un `request_token` para autenticación de usuario
	func requestToken() async throws-> RequestTokenResponse
	/// Crea una sesión con el `request_token` autorizado
	func createSession(requestToken: String) async throws -> SessionResponse
	/// Crea una sesión de invitado
	func createGuestSession() async throws -> GuestSessionResponse
}

/// Implementación del repositorio de autenticación que interactúa con la API de TMDb.
struct AuthenticationRepository: AuthenticationRepositoryProtocol {
	
	let networkService: NetworkInteractor
	
	/// Inicializa el repositorio con un `NetworkInteractor`.
	/// - Parámetro networkService: Servicio de red utilizado para realizar solicitudes HTTP.
	init(networkService: NetworkInteractor = NetworkService()) {
		self.networkService = networkService
	}
	
	/// Solicita un `request_token` para autenticación de usuario
	func requestToken() async throws -> RequestTokenResponse {
		try await networkService.executeRequest(.requestToken(), type: RequestTokenResponse.self)
	}
	
	/// Crea una sesión con el `request_token` autorizado
	func createSession(requestToken: String) async throws -> SessionResponse {
		try await networkService.executeRequest(.createSession(requestToken: requestToken), type: SessionResponse.self)
	}
	
	/// Crea una sesión de invitado
	func createGuestSession() async throws -> GuestSessionResponse {
		try await networkService.executeRequest(.guestSession(), type: GuestSessionResponse.self)
	}
	
	
}
