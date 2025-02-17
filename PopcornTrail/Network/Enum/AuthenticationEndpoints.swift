//
//  AuthenticationEndpoints.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 17/2/25.
//

import Foundation

/// Definición de los endpoints de autenticación en TMDb
enum AuthenticationEndpoints: String {
	case requestToken = "/authentication/token/new"
	case createSession = "/authentication/session/new"
	case guestSession = "/authentication/guest_session/new"
}
