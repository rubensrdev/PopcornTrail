//
//  ContentView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 10/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
			Image(systemName: "popcorn.fill")
				.resizable()
				.scaledToFit()
				.frame(width: 50)
				.foregroundStyle(.red)
            Text("🔎 Keep track of the best content")
				.font(.title3)
				.fontWeight(.semibold)
				.fontDesign(.rounded)
				.foregroundStyle(.white)
				.background(
					LinearGradient(colors: [.red, .pink, .orange, .yellow, .mint, .green], startPoint: .leading, endPoint: .trailing)
						.opacity(0.7)
				)
				.clipShape(RoundedRectangle(cornerRadius: 5))
				
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
