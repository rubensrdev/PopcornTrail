//
//  MovieRepository.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 3/3/25.
//

import Foundation

/// Este protocolo define las operaciones disponibel para obtener películas
protocol MovieRepositoryProtocol {
	/// Obtiene la lista de películas populares.
	/// - Returns: Un array de `Movie`.
	/// - Throws: `NetworkError` en caso de fallo en la solicitud o decodificación.
	func getPopularMoview() async throws -> [Movie]
}

struct MovieRepository: MovieRepositoryProtocol {
	/// Obtiene la lista de películas populares desde el API
	func getPopularMoview() async throws -> [Movie] {
		let request = URLRequest.getPopularMovies()
		
		let (data, response) = try await URLSession.shared.data(for: request)
		
		guard let httpResponse = response as? HTTPURLResponse else {
			throw NetworkError.nonHttp
		}
		
		guard httpResponse.statusCode == 200 else {
			throw NetworkError.status(httpResponse.statusCode)
		}
		
		do {
			let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
			return movieResponse.results
		} catch {
			throw NetworkError.json(error)
		}
	}
}
