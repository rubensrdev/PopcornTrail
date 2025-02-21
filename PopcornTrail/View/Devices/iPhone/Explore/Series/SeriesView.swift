//
//  SeriesView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 21/2/25.
//

import SwiftUI

struct SeriesView: View {
    var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea()
				.opacity(0.85)
			VStack {
				Text("Series")
					.font(.largeTitle)
					.bold()
					.foregroundColor(.white)
			}
		}
    }
}

#Preview {
    SeriesView()
}
