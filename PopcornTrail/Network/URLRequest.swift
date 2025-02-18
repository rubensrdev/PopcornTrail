//
//  URLRequest.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 18/2/25.
//

import Foundation

extension URLRequest {
	
	/// Crea una solicitud HTTP `GET para obtener un `request_token`
	static func requestToken() -> URLRequest {
		var request = URLRequest(url: .requestToken())
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		return request
	}
	
	/// Crea una solicitud HTTP `POST` para intercambiar un `request_token` por un `session_id`
	static func createSession(requestToken: String) -> URLRequest {
		var request = URLRequest(url: .createSession())
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		let body = ["request_token": requestToken]
		request.httpBody = try? JSONEncoder().encode(body)
		
		return request
	}
	
	/// Crea una solicitud HTTP `GET` para generar una sesión de invitado
	   static func guestSession() -> URLRequest {
		   var request = URLRequest(url: URL.guestSession())
		   request.httpMethod = "GET"
		   request.setValue("application/json", forHTTPHeaderField: "Accept")
		   return request
	   }
	
}
