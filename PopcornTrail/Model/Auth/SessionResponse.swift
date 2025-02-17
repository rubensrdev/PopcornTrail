//
//  SessionResponse.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 17/2/25.
//

import Foundation

/// Esta es la respuesta al intercambio de un `request_token` autorizado por un `session_id`
struct SessionResponse: Codable {
	let success: Bool
	let sessionId: String
	
	enum CodingKeys: String, CodingKey {
		case success
		case sessionId = "session_id"
	}
}
