//
//  ExploreView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 21/2/25.
//

import SwiftUI

struct ExploreView: View {
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
		.tint(.white)
		.onAppear { UITabBar.appearance().unselectedItemTintColor = .gray }
    }
}

#Preview {
    ExploreView()
}
