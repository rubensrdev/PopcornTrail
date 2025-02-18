//
//  APIConfig.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 17/2/25.
//

import Foundation

/// Gestiona la configuración del API de TMDb
struct APIConfig {
	
	/// Instancia compartida (singleton) para acceso global a la configuración del API
	static let shared = APIConfig()
	
	/// URL base del API de TMDb
	let baseURL = URL(string: "https://api.themoviedb.org/3")!
	
	/// Obtiene el apikey desde el plist
	var apiKey: String {
		guard let key = Bundle.main.object(forInfoDictionaryKey: "TMDBApiKey") as? String else {
			fatalError("❌ API Key no encontrada en Info.plist")
		}
		return key
	}
}

