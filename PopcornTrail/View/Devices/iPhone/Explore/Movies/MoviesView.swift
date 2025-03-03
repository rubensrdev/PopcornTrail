//
//  MoviesView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 21/2/25.
//

import SwiftUI

struct MoviesView: View {
	
	@Environment(LoginViewModel.self) private var loginVM
	@State private var vm = MoviesViewModel()
	
	var body: some View {
		NavigationStack {
			Group {
				if vm.isLoading {
					ProgressView("Loading... 🎬")
				} else if !vm.errorMessage.isEmpty {
					Text(vm.errorMessage)
						.foregroundColor(.red)
						.multilineTextAlignment(.center)
						.padding()
				} else {
					List(vm.popularMovies) { movie in
						Text(movie.title)
					}
					.scrollContentBackground(.hidden)
					.background(Color.clear)
					
				}
			}
			.navigationTitle("Movies")
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button {
						loginVM.logout()
					} label: {
						Image(systemName: "power.circle")
							.foregroundStyle(.red).bold()
					}
					
				}
			}
		}
	}
}

#Preview {
	MoviesView()
		.environment(LoginViewModel())
}
