//
//  URLRequest.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 18/2/25.
//

import Foundation

import Foundation

extension URLRequest {
	
	/// Crea una solicitud HTTP `GET` para obtener un `request_token`
	static func requestToken() -> URLRequest {
		var request = URLRequest(url: .requestToken())
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("Bearer \(APIConfig.shared.apiKey)", forHTTPHeaderField: "Authorization") 
		return request
	}
	
	/// Crea una solicitud HTTP `POST` para intercambiar un `request_token` por un `session_id`
	static func createSession(requestToken: String) -> URLRequest {
		var request = URLRequest(url: .createSession())
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.setValue("Bearer \(APIConfig.shared.apiKey)", forHTTPHeaderField: "Authorization")
		
		let body = ["request_token": requestToken]
		request.httpBody = try? JSONEncoder().encode(body)
		
		return request
	}
	
	/// Crea una solicitud HTTP `GET` para generar una sesión de invitado
	static func guestSession() -> URLRequest {
		var request = URLRequest(url: URL.guestSession())
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("Bearer \(APIConfig.shared.apiKey)", forHTTPHeaderField: "Authorization")
		return request
	}
	
	/// Crea una solicitud HTTP `GET` para obtener un listado de películas populares
	static func getPopularMovies() -> URLRequest {
		var request = URLRequest(url: .popularMovies())
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("Bearer \(APIConfig.shared.apiKey)", forHTTPHeaderField: "Authorization")
		return request
	}
	
	/// Crea una solicitud HTTP `GET` para obtener un listado de películas más valoradas
	static func getTopRatedMovies() -> URLRequest {
		var request = URLRequest(url: .topRatedMovies())
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("Bearer \(APIConfig.shared.apiKey)", forHTTPHeaderField: "Authorization")
		return request
	}
	
	/// Crea una solicitud HTTP `GET` para obtener un listado de películas en cartelera
	static func getNowPlayingMovies() -> URLRequest {
		var request = URLRequest(url: .nowPlayingMovies())
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("Bearer \(APIConfig.shared.apiKey)", forHTTPHeaderField: "Authorization")
		return request
	}
	
	/// Crea una solicitud HTTP `GET` para obtener un listado de los próximos estrenos de películas
	static func getUpcomingMovies() -> URLRequest {
		var request = URLRequest(url: .popularMovies())
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("Bearer \(APIConfig.shared.apiKey)", forHTTPHeaderField: "Authorization")
		return request
	}
	
	/// Crea una solicitud HTTP `GET` para obtener un listado de series más populares
	static func getPopularSeries() -> URLRequest {
		var request = URLRequest(url: .popularSeries())
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("Bearer \(APIConfig.shared.apiKey)", forHTTPHeaderField: "Authorization")
		return request
	}
	
	/// Crea una solicitud HTTP `GET` para obtener un listado de series más valoradas
	static func getTopRatedSeries() -> URLRequest {
		var request = URLRequest(url: .topRatedSeries())
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("Bearer \(APIConfig.shared.apiKey)", forHTTPHeaderField: "Authorization")
		return request
	}
	
	/// Crea una solicitud HTTP `GET` para obtener un listado de series en emisión
	static func getOnTheAirSeries() -> URLRequest {
		var request = URLRequest(url: .onAirSeries())
		request.httpMethod = "GET"
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("Bearer \(APIConfig.shared.apiKey)", forHTTPHeaderField: "Authorization")
		return request
	}
	
}
