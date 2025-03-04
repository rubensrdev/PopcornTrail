//
//  CarouselSectionView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 3/3/25.
//

import SwiftUI

/// Vista reutilizable para mostrar una sección de contenido en carrusel horizontal
struct MovieCarouselSectionView: View {
	let title: String
	let movies: [Movie]
	
	var body: some View {
		VStack(alignment: .leading) {

			Text(title)
				.sectionTextTitleStyle()
			
			ScrollView(.horizontal, showsIndicators: false) {
				LazyHStack(spacing: 16) {
					ForEach(movies) { movie in
						VStack {
							PosterView(url: movie.posterURL)
							Text(movie.title)
								.textStyleForTitleWithPoster()
							HStack(spacing: 4) {
								Image(systemName: "star.fill")
									.foregroundStyle(.yellow)
								Text(String(format: "%.1f", movie.voteAverage))
									.textStyleForRatingWithPoster()
							}
							Text(movie.releaseDate)
								.textStyleForReleaseDateWithPoster()
								
						}
						.padding(12)
						.background(.ultraThinMaterial)
						.clipShape(
							RoundedRectangle(cornerRadius: 12)
						)
						.shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 4)
					}
				}
				.padding()
			}
		}
	}
}

#Preview {
	MovieCarouselSectionView(title: "Popular", movies: Movie.sampleMovies)
}
