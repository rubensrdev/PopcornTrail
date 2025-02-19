//
//  AuthenticationRepository.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 19/2/25.
//

import Foundation

/// Este protocolo define las operaciones de autenticación con TMDb
protocol AuthenticationRepository {
	/// Solicita un `request_token` para autenticación de usuario
	func requestToken() async throws-> RequestTokenResponse
	/// Crea una sesión con el `request_token` autorizado
	func createSession(requestToken: String) async throws -> SessionResponse
	/// Crea una sesión de invitado
	func createGuestSession() async throws -> GuestSessionResponse
}
