//
//  ExploreView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 21/2/25.
//

import SwiftUI

struct ExploreView: View {
	@Environment(LoginViewModel.self) private var loginVM
    var body: some View {
		TabView {
			MoviesView()
				.tabItem {
					Label("Movies", systemImage: "film")
				}
			SeriesView()
				.tabItem {
					Label("Series", systemImage: "tv.fill")
				}
		}
    }
}

#Preview {
    ExploreView()
		.environment(LoginViewModel())
}
