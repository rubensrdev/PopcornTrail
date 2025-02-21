//
//  MovieResponse.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 21/2/25.
//

import Foundation


/// Representa la respuesta paginada de la API de TMDb al consultar una lista de películas.
///
/// - Propiedades:
///   - `page`: Número de la página actual en la consulta.
///   - `results`: Lista de películas devueltas en la respuesta.
///   - `totalPages`: Número total de páginas disponibles.
///   - `totalResults`: Número total de películas disponibles en la consulta.
struct MovieResponse: Codable {
	let page: Int
	let results: [Movie]
	let totalPages: Int
	let totalResults: Int
	
	enum CodingKeys: String, CodingKey {
		case page, results
		case totalPages = "total_pages"
		case totalResults = "total_results"
	}
}
