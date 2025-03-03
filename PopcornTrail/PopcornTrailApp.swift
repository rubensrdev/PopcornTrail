//
//  PopcornTrailApp.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 10/2/25.
//

import SwiftUI

@main
struct PopcornTrailApp: App {
	
	@State private var loginVM = LoginViewModel()
	
    var body: some Scene {
        WindowGroup {
			if loginVM.isLoggedIn {
				ExploreView()
					.environment(loginVM)
					.transition(.opacity)
			} else {
				LoginView()
					.environment(loginVM)
					.transition(.opacity)
			}
        }
    }
}
