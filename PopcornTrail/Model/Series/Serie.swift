//
//  Serie.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 4/3/25.
//

import Foundation

/// Representa una serie de televisión obtenida desde la API de TMDb.
/// 
/// - Propiedades:
///   - `id`: Identificador único de la serie.
///   - `name`: Nombre de la serie en el idioma principal.
///   - `originalName`: Nombre original de la serie.
///   - `overview`: Descripción o sinopsis de la serie.
///   - `posterPath`: Ruta relativa al póster de la serie (opcional).
///   - `backdropPath`: Ruta relativa a la imagen de fondo de la serie (opcional).
///   - `firstAirDate`: Fecha de estreno de la serie en formato "YYYY-MM-DD".
///   - `genreIDs`: Lista de identificadores de los géneros asociados a la serie.
///   - `originalLanguage`: Código de idioma original de la serie (ejemplo: "en" para inglés).
///   - `popularity`: Índice de popularidad de la serie.
///   - `voteAverage`: Puntuación media basada en las valoraciones de los usuarios.
///   - `voteCount`: Número total de votos recibidos.
///   - `originCountry`: Lista de códigos de países de origen de la serie.
///
struct Serie: Codable, Identifiable, Hashable {
	let id: Int
	let name: String
	let originalName: String
	let overview: String
	let posterPath: String?
	let backdropPath: String?
	let firstAirDate: String
	let genreIDs: [Int]
	let originalLanguage: String
	let popularity: Double
	let voteAverage: Double
	let voteCount: Int
	let originCountry: [String]
	
	enum CodingKeys: String, CodingKey {
		case id, name, overview, popularity
		case originalName = "original_name"
		case posterPath = "poster_path"
		case backdropPath = "backdrop_path"
		case firstAirDate = "first_air_date"
		case genreIDs = "genre_ids"
		case originalLanguage = "original_language"
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
		case originCountry = "origin_country"
	}
}

extension Serie {
	/// URL completa del póster de la serie.
	var posterURL: URL? {
		guard let posterPath else { return nil }
		return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
	}
}
