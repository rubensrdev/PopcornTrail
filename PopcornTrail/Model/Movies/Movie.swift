//
//  Movie.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 21/2/25.
//

import Foundation


/// Representa una película obtenida desde la API de TMDb.
///
/// - Propiedades:
///   - `id`: Identificador único de la película.
///   - `title`: Título de la película en el idioma principal.
///   - `originalTitle`: Título original de la película.
///   - `overview`: Descripción o sinopsis de la película.
///   - `posterPath`: Ruta relativa a la imagen del póster de la película (opcional).
///   - `backdropPath`: Ruta relativa a la imagen de fondo de la película (opcional).
///   - `releaseDate`: Fecha de estreno de la película en formato "YYYY-MM-DD".
///   - `genreIDs`: Lista de identificadores de los géneros asociados a la película.
///   - `originalLanguage`: Código de idioma original de la película (ejemplo: "en" para inglés).
///   - `popularity`: Puntuación de popularidad de la película.
///   - `voteAverage`: Puntuación media basada en las valoraciones de los usuarios.
///   - `voteCount`: Número total de votos recibidos.
///   - `adult`: Indica si la película es solo para adultos (`true`) o apta para todos los públicos (`false`).
///   - `video`: Indica si la película tiene contenido de video asociado (`true`) o no (`false`).
///
struct Movie: Codable, Identifiable, Hashable {
	let id: Int
	let title: String
	let originalTitle: String
	let overview: String
	let posterPath: String?
	let backdropPath: String?
	let releaseDate: String
	let genreIDs: [Int]
	let originalLanguage: String
	let popularity: Double
	let voteAverage: Double
	let voteCount: Int
	let adult: Bool
	let video: Bool
	
	enum CodingKeys: String, CodingKey {
		case id, title, overview, popularity, adult, video
		case originalTitle = "original_title"
		case posterPath = "poster_path"
		case backdropPath = "backdrop_path"
		case releaseDate = "release_date"
		case genreIDs = "genre_ids"
		case originalLanguage = "original_language"
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
	}
}
