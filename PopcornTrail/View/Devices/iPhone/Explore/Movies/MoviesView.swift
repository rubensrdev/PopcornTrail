//
//  MoviesView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 21/2/25.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea()
				.opacity(0.85)
			VStack {
				Text("Movies")
					.font(.largeTitle)
					.bold()
					.foregroundColor(.white)
			}
		}
    }
}

#Preview {
    MoviesView()
}
