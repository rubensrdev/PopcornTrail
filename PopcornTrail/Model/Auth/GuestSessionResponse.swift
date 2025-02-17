//
//  GuestSessionResponse.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 17/2/25.
//

import Foundation

/// Respuesta al crear una sesión de invitado
struct GuestSessionResponse: Codable {
	let success: Bool
	let guestSessionId: String
	let expiresAt: String
	
	enum CodingKeys: String, CodingKey {
		case success
		case guestSessionId = "guest_session_id"
		case expiresAt = "expires_at"
	}
}
