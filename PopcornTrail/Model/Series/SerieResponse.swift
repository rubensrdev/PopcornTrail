//
//  SerieResponse.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 4/3/25.
//

import Foundation

/// Representa la respuesta de la API de TMDb al solicitar una lista de series de televisión.
struct SerieResponse: Codable {
	let page: Int
	let results: [Serie]
	let totalResults: Int
	let totalPages: Int
	
	enum CodingKeys: String, CodingKey {
		case page, results
		case totalResults = "total_results"
		case totalPages = "total_pages"
	}
}
