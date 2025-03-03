//
//  TextStyles.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 3/3/25.
//

import SwiftUI

extension Text {
	func textStyleForTitleWithPoster() -> some View {
		self
			.font(.headline)
			.fontDesign(.rounded)
			.multilineTextAlignment(.center)
			.frame(width: 100)
	}
}
