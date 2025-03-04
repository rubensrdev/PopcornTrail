//
//  SeriesRepositoryPreview.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 4/3/25.
//

import Foundation

/// Repositorio de series para previsualización en SwiftUI
struct SeriesRepositoryPreview: SeriesRepositoryProtocol {
	func getPopularSeries() async throws -> [Serie] {
		guard let url = Bundle.main.url(forResource: "PopularSeries", withExtension: "json") else {
			throw NetworkError.dataNotValid
		}
		
		let data = try Data(contentsOf: url)
		let response = try JSONDecoder().decode(SerieResponse.self, from: data)
		
		return response.results
	}
	
	func getTopRatedSeries() async throws -> [Serie] {
		guard let url = Bundle.main.url(forResource: "TopRatedSeries", withExtension: "json") else {
			throw NetworkError.dataNotValid
		}
		
		let data = try Data(contentsOf: url)
		let response = try JSONDecoder().decode(SerieResponse.self, from: data)
		
		return response.results
	}
	
	func getOntheAirSeries() async throws -> [Serie] {
		guard let url = Bundle.main.url(forResource: "OnTheAirSeries", withExtension: "json") else {
			throw NetworkError.dataNotValid
		}
		
		let data = try Data(contentsOf: url)
		let response = try JSONDecoder().decode(SerieResponse.self, from: data)
		
		return response.results
	}
	
	
}
