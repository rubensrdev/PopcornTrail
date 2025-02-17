//
//  RequestTokenResponse.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 17/2/25.
//

import Foundation

/// Esta es la respuesta al solicitar un `request_token` para autenticación de usuario
struct RequestTokenResponse: Codable {
	let success: Bool
	let expiresAt: String
	let requestToken: String
	
	enum CodingKeys: String, CodingKey {
		case success
		case expiresAt = "expires_at"
		case requestToken = "request_token"
	}
}
