//
//  MovieRepositoryPreview.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 3/3/25.
//

import Foundation

/// Repositorio de películas para previsualización en SwiftUI
struct MovieRepositoryPreview: MovieRepositoryProtocol {
	func getTopRatedMovies() async throws -> [Movie] {
		guard let url = Bundle.main.url(forResource: "TopRatedMovies", withExtension: "json") else {
			throw NetworkError.dataNotValid
		}
		
		let data = try Data(contentsOf: url)
		let response = try JSONDecoder().decode(MovieResponse.self, from: data)
		
		return response.results
	}
	
	func getNowPlayingMovies() async throws -> [Movie] {
		guard let url = Bundle.main.url(forResource: "NowPlayingMovies", withExtension: "json") else {
			throw NetworkError.dataNotValid
		}
		
		let data = try Data(contentsOf: url)
		let response = try JSONDecoder().decode(MovieResponse.self, from: data)
		
		return response.results
	}
	
	func getUpcomingMovies() async throws -> [Movie] {
		guard let url = Bundle.main.url(forResource: "UpcomingMovies", withExtension: "json") else {
			throw NetworkError.dataNotValid
		}
		
		let data = try Data(contentsOf: url)
		let response = try JSONDecoder().decode(MovieResponse.self, from: data)
		
		return response.results
	}
	
	/// Carga las películas populares desde un archivo JSON
	func getPopularMovies() async throws -> [Movie] {
		guard let url = Bundle.main.url(forResource: "PopularMovies", withExtension: "json") else {
			throw NetworkError.dataNotValid
		}
		
		let data = try Data(contentsOf: url)
		let response = try JSONDecoder().decode(MovieResponse.self, from: data)
		
		return response.results
	}
}
