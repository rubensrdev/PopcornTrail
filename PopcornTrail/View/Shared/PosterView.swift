//
//  PosterView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 3/3/25.
//

import SwiftUI

struct PosterView: View {
	let url: URL?
	var body: some View {
		if let url = url {
			AsyncImage(url: url) { image in
				image.resizable()
					.scaledToFill()
					.frame(width: 150, height: 225)
					.clipShape(RoundedRectangle(cornerRadius: 12))
					.shadow(color: .black.opacity(0.6), radius: 8, x: 0, y: 4)
			} placeholder: {
				ProgressView()
					.frame(width: 150, height: 225)
			}
		} else {
			Image(systemName: "film")
				.resizable()
				.scaledToFit()
				.frame(width: 100, height: 150)
				.foregroundColor(.gray.opacity(0.7))
		}
	}
}

#Preview {
	PosterView(url: Movie.posterURL)
}
