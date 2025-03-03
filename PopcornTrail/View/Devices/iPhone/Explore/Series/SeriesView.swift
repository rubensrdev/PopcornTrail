//
//  SeriesView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 21/2/25.
//

import SwiftUI

struct SeriesView: View {
    var body: some View {
		NavigationStack {
			Group {
				Text("Series")
					.font(.largeTitle)
					.bold()
			}
		}
    }
}

#Preview {
    SeriesView()
}
