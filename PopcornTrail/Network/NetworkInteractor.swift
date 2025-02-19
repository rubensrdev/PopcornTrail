//
//  NertworkInteractor.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 18/2/25.
//

import Foundation

/// Protocolo base para gestionar las solicitudes de red
protocol NetworkInteractor: Sendable {
	var session: URLSession { get }
}

extension NetworkInteractor {
	
	/// Ejecuta la solicitud HTTP y decodifica la respuesta en el tipo especificado
	func executeRequest<T: Codable>(_ request: URLRequest, type: T.Type) async throws -> T {
		print("✅ [NetworkService] Ejecutando solicitud a la URL: \(request.url?.absoluteString ?? "URL no válida")")
		print("✅ [NetworkService] Headers: \(request.allHTTPHeaderFields ?? [:])")
		let (data, response) = try await session.data(for: request)
		
		guard let httpResponse = response as? HTTPURLResponse else {
			throw NetworkError.nonHttp
		}
		
		guard httpResponse.statusCode == 200 else {
			throw NetworkError.status(httpResponse.statusCode)
		}
		
		do {
			return try JSONDecoder().decode(T.self, from: data)
		} catch {
			throw NetworkError.json(error)
		}
	}
}

