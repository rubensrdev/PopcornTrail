//
//  SeriesRepository.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 4/3/25.
//

import Foundation

/// Este protocolo define las operaciones disponibel para obtener series
protocol SeriesRepositoryProtocol: Sendable {
	/// Obtiene la lista de películas populares
	func getPopularSeries() async throws -> [Serie]
	/// Obtiene la lista de series mejor valoradas.
	func getTopRatedSeries() async throws -> [Serie]
	/// Obtiene la lista de series en emisión
	func getOntheAirSeries() async throws -> [Serie]
}

struct SeriesRepository: SeriesRepositoryProtocol {
	/// Obtiene la lista de series populares desde el API
	func getPopularSeries() async throws -> [Serie] {
		let request = URLRequest.getPopularSeries()
		let (data, response) = try await URLSession.shared.data(for: request)
		
		guard let httpResponse = response as? HTTPURLResponse else {
			throw NetworkError.nonHttp
		}
		
		guard httpResponse.statusCode == 200 else {
			throw NetworkError.status(httpResponse.statusCode)
		}
		
		do {
			let serieResponse = try JSONDecoder().decode(SerieResponse.self, from: data)
			return serieResponse.results
		} catch {
			throw NetworkError.json(error)
		}
	}
	/// Obtiene la lista de series populares desde el API
	func getTopRatedSeries() async throws -> [Serie] {
		let request = URLRequest.getTopRatedSeries()
		let (data, response) = try await URLSession.shared.data(for: request)
		
		guard let httpResponse = response as? HTTPURLResponse else {
			throw NetworkError.nonHttp
		}
		
		guard httpResponse.statusCode == 200 else {
			throw NetworkError.status(httpResponse.statusCode)
		}
		
		do {
			let serieResponse = try JSONDecoder().decode(SerieResponse.self, from: data)
			return serieResponse.results
		} catch {
			throw NetworkError.json(error)
		}
	}
	/// Obtiene la lista de series en emisión desde el API
	func getOntheAirSeries() async throws -> [Serie] {
		let request = URLRequest.getOnTheAirSeries()
		let (data, response) = try await URLSession.shared.data(for: request)
		
		guard let httpResponse = response as? HTTPURLResponse else {
			throw NetworkError.nonHttp
		}
		
		guard httpResponse.statusCode == 200 else {
			throw NetworkError.status(httpResponse.statusCode)
		}
		
		do {
			let serieResponse = try JSONDecoder().decode(SerieResponse.self, from: data)
			return serieResponse.results
		} catch {
			throw NetworkError.json(error)
		}
	}
	
	
}
