//
//  URL.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 17/2/25.
//

import Foundation

extension URL {
	static func requestToken() -> URL {
		APIConfig.shared.baseURL
			.appending(path: AuthenticationEndpoints.requestToken.rawValue)
			.appending(queryItems: [.apiKey()])
	}
}

extension URLQueryItem {
	
	/// Agrega el parámetro `api_key`
	static func apiKey() -> URLQueryItem {
		URLQueryItem(name: "api_key", value: APIConfig.shared.apiKey)
	}
	
	/// Agrega el parámetro `request_token`
	static func requestToken(_ token: String) -> URLQueryItem {
		URLQueryItem(name: "request_token", value: token)
	}
}
