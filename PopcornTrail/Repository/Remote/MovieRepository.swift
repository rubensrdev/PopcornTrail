//
//  MovieRepository.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 3/3/25.
//

import Foundation

/// Este protocolo define las operaciones disponibel para obtener películas
protocol MovieRepositoryProtocol: Sendable {
	/// Obtiene la lista de películas populares
	func getPopularMovies() async throws -> [Movie]
	/// Obtiene la lista de películas mejor valoradas.
	func getTopRatedMovies() async throws -> [Movie]
	/// Obtiene la lista de películas en cartelera
	func getNowPlayingMovies() async throws -> [Movie]
	/// Obtiene la lista de películas que se van a estrenar próximamente
	func getUpcomingMovies() async throws -> [Movie]
}

struct MovieRepository: MovieRepositoryProtocol {
	/// Obtiene la lista de películas populares desde el API
	func getPopularMovies() async throws -> [Movie] {
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
	/// Obtiene la lista de películas más valoradas desde el API
	func getTopRatedMovies() async throws -> [Movie] {
		let request = URLRequest.getTopRatedMovies()
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
	
	/// Obtiene la lista de películas en cartelera desde el API
	func getNowPlayingMovies() async throws -> [Movie] {
		let request = URLRequest.getNowPlayingMovies()
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
	
	/// Obtiene la lista de próximos estrenos desde el API
	func getUpcomingMovies() async throws -> [Movie] {
		let request = URLRequest.getUpcomingMovies()
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
