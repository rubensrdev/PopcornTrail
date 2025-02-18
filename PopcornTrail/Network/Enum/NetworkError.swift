//
//  NetworkError.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 18/2/25.
//

import Foundation

/// Enumeración que define diferentes tipos de errores de red que pueden ocurrir durante la interacción con servicios web
enum NetworkError: LocalizedError {
	case dataNotValid
	case nonHttp
	case json(Error)
	case status(Int)
	case unknown(Error)
	
	/// Descripción legible del error.
	var errorDescription: String? {
		switch self {
			case .dataNotValid:
				"Los datos recibidos no son válidos."
			case .nonHttp:
				"La respuesta no corresponde a un protocolo HTTP válido."
			case .json(let error):
				"Error de JSON: \(error)"
			case .status(let code):
				"Error de estado HTTP: \(code)"
			case .unknown(let error):
				"Error desconocido: \(error)"
		}
	}
}
