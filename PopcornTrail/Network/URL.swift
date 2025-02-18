//
//  URL.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 17/2/25.
//

import Foundation

extension URL {
	
	/// Construcción de URL para solicitar el `request_token`
	static func requestToken() -> URL {
		APIConfig.shared.baseURL
			.appending(path: AuthenticationEndpoints.requestToken.rawValue)
			.appending(queryItems: [.apiKey()])
	}
	
	/// Contrucción de URL para crear una sesión con el `request_token`
	static func createSession() -> URL {
		APIConfig.shared.baseURL
			.appending(path: AuthenticationEndpoints.createSession.rawValue)
	}
	
	/// Construcción de URL para crear una sesión de invitado
	static func guestSession() -> URL {
		APIConfig.shared.baseURL
			.appending(path: AuthenticationEndpoints.guestSession.rawValue)
			.appending(queryItems: [.apiKey()])
	}
	
}

extension URLQueryItem {
	
	/// Agrega el parámetro `api_key`
	static func apiKey() -> URLQueryItem {
		URLQueryItem(name: "api_key", value: APIConfig.shared.apiKey)
	}
}
