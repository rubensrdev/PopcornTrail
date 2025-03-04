//
//  URL.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 17/2/25.
//

import Foundation

import Foundation

extension URL {
	
	/// Construcción de URL para solicitar el `request_token`
	static func requestToken() -> URL {
		APIConfig.shared.baseURL
			.appending(path: AuthenticationEndpoints.requestToken.rawValue)
	}
	
	/// Construcción de URL para crear una sesión con el `request_token`
	static func createSession() -> URL {
		APIConfig.shared.baseURL
			.appending(path: AuthenticationEndpoints.createSession.rawValue)
	}
	
	/// Construcción de URL para crear una sesión de invitado
	static func guestSession() -> URL {
		APIConfig.shared.baseURL
			.appending(path: AuthenticationEndpoints.guestSession.rawValue)
	}
	
	/// Construcción de URL para consultar películas populares
	static func popularMovies() -> URL {
		APIConfig.shared.baseURL.appending(path: MoviesEndpoints.popular.rawValue)
	}
	
	/// Construcción de URL para consultar películas más valoradas
	static func topRatedMovies() -> URL {
		APIConfig.shared.baseURL.appending(path: MoviesEndpoints.topRated.rawValue)
	}
	
	/// Construcción de URL para consultar películas en cartelera
	static func nowPlayingMovies() -> URL {
		APIConfig.shared.baseURL.appending(path: MoviesEndpoints.nowPlaying.rawValue)
	}
	
	/// Construcción de URL para consultar los próximos estrenos de películas
	static func upcomingMovies() -> URL {
		APIConfig.shared.baseURL.appending(path: MoviesEndpoints.upcoming.rawValue)
	}
	
	/// Construcción de URL para consultar series populares
	static func popularSeries() -> URL {
		APIConfig.shared.baseURL.appending(path: SeriesEndpoint.popular.rawValue)
	}
	
	/// Construcción de URL para consultar series más valoradas
	static func topRatedSeries() -> URL {
		APIConfig.shared.baseURL.appending(path: SeriesEndpoint.topRated.rawValue)
	}
	
	/// Construcción de URL para consultar series en emisión
	static func onAirSeries() -> URL {
		APIConfig.shared.baseURL.appending(path: SeriesEndpoint.onTheAir.rawValue)
	}
	
}

extension URLQueryItem {
	
	/// Agrega el parámetro `api_key`
	static func apiKey() -> URLQueryItem {
		URLQueryItem(name: "api_key", value: APIConfig.shared.apiKey)
	}
}
