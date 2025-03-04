//
//  SerieCarouselSectionView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 4/3/25.
//

import SwiftUI

/// Vista reutilizable para mostrar una sección de contenido en carrusel horizontal para series
struct SerieCarouselSectionView: View {
	let title: String
	let series: [Serie]
	var body: some View {
		VStack(alignment: .leading) {
			Text(title)
				.sectionTextTitleStyle()
			
			ScrollView(.horizontal, showsIndicators: false) {
				LazyHStack(spacing: 16) {
					ForEach(series) { serie in
						VStack {
							PosterView(url: serie.posterURL)
							Text(serie.name)
								.textStyleForTitleWithPoster()
							HStack(spacing: 4) {
								Image(systemName: "star.fill")
									.foregroundStyle(.yellow)
								Text(String(format: "%.1f", serie.voteAverage))
									.textStyleForRatingWithPoster()
							}
							Text(serie.firstAirDate)
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
		.padding(.bottom)
	}
}

#Preview {
	SerieCarouselSectionView(title: "Top Rated Series", series: Serie.sampleSeries)
}
