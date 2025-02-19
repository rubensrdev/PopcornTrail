//
//  PopcornTrailApp.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 10/2/25.
//

import SwiftUI

@main
struct PopcornTrailApp: App {
	
	@State var loginVM = LoginViewModel()
	
    var body: some Scene {
        WindowGroup {
			LoginView()
				.environment(loginVM)
        }
    }
}
