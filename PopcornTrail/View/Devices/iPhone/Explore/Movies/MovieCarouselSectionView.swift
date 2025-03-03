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
				.font(.title2)
				.fontDesign(.rounded)
				.fontWeight(.semibold)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.leading, 16)
			
			ScrollView(.horizontal, showsIndicators: false) {
				LazyHStack(spacing: 16) {
					ForEach(movies) { movie in
						VStack {
							PosterView(url: movie.posterURL)
							Text(movie.title)
								.textStyleForTitleWithPoster()
						}
						.padding(8)
					}
				}
				.padding(.horizontal)
			}
		}
	}
}

#Preview {
	MovieCarouselSectionView(title: "Popular", movies: Movie.sampleMovies)
}
