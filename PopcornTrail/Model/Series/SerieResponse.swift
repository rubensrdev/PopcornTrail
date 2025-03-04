//
//  SerieResponse.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 4/3/25.
//

import Foundation

/// Representa la respuesta de la API de TMDb al solicitar una lista de series de televisión.
///
/// - Propiedades:
///   - `page`: Número de página de la respuesta actual.
///   - `results`: Lista de series de televisión obtenidas en la consulta.
///   - `totalResults`: Número total de resultados disponibles en la API.
///   - `totalPages`: Número total de páginas disponibles en la API.
///
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
