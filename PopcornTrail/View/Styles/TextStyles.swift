//
//  TextStyles.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 3/3/25.
//

import SwiftUI

extension Text {
	
	func sectionTextTitleStyle() -> some View {
		self
			.font(.title2)
			.fontDesign(.rounded)
			.fontWeight(.semibold)
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.leading, 16)
	}
	
	func textStyleForTitleWithPoster() -> some View {
		self
			.font(.headline)
			.fontDesign(.rounded)
			.multilineTextAlignment(.center)
			.frame(width: 100)
	}
	
	func textStyleForRatingWithPoster() -> some View {
		self
			.font(.subheadline)
			.fontDesign(.rounded)
			.foregroundStyle(.secondary)
	}
	
	func textStyleForReleaseDateWithPoster() -> some View {
		self
			.font(.caption)
			.fontDesign(.rounded)
			.foregroundStyle(.tertiary)
	}
}
