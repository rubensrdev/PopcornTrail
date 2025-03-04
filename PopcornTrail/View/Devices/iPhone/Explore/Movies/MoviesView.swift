//
//  MoviesView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 21/2/25.
//

import SwiftUI

struct MoviesView: View {
	
	@Environment(LoginViewModel.self) private var loginVM
	@State private var vm = MoviesViewModel(repository: MovieRepositoryPreview())
	
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
					ScrollView {
						MovieCarouselSectionView(title: "Popular Movies", movies: vm.popularMovies)
						MovieCarouselSectionView(title: "Top Rated Movies", movies: vm.topRatedMovies)
						MovieCarouselSectionView(title: "Now Playing Movies", movies: vm.nowPlayingMovies)
						MovieCarouselSectionView(title: "Upcoming Movies", movies: vm.upcomingMovies)
					}
				}
			}
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
		.task {
			await vm.loadAllTypesOfMovies()
		}
	}
}

#Preview {
	MoviesView()
		.environment(LoginViewModel())
}
