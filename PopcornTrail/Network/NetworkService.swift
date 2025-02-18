//
//  NetworkService.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 18/2/25.
//

import Foundation

/// `NetworkService` es la implementación concreta del `NetworkInteractor`
/// y se encarga de gestionar las solicitudes de red a través de `URLSession`.
///
/// - Conformidad:
///   - `NetworkInteractor`: Proporciona el método `executeRequest(_:,type:)`
///     a través de una extensión del protocolo.
struct NetworkService: NetworkInteractor {
	let session: URLSession = .shared
}
