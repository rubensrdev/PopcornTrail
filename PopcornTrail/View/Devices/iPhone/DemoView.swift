//
//  ContentView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 10/2/25.
//

import SwiftUI

struct DemoView: View {
	var body: some View {
		VStack {
			VStack {
				Image(systemName: "popcorn.fill")
					.resizable()
					.scaledToFit()
					.frame(width: 50)
					.foregroundStyle(.white)
				Text("Popcorn Trail")
					.font(.title)
				Text("🔎 Keep track of the best content")
					.font(.title3)
			}
			.padding()
			.fontWeight(.semibold)
			.fontDesign(.rounded)
			.foregroundStyle(.white)
			.background(
				LinearGradient(colors: [.red, .pink, .orange, .yellow, .mint, .green], startPoint: .leading, endPoint: .trailing)
					.opacity(0.7)
			)
			.clipShape(RoundedRectangle(cornerRadius: 10))
		}
		.padding()
	}
}

#Preview {
	DemoView()
}
