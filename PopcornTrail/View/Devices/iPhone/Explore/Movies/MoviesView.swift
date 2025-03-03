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
					VStack {
						Text("Popular Movies")
							.font(.title2)
							.fontDesign(.rounded)
							.fontWeight(.semibold)
							.frame(maxWidth: .infinity, alignment: .leading)
							.padding(.leading, 16)
						ScrollView(.horizontal) {
							LazyHStack(spacing: 16) {
								ForEach(vm.popularMovies) { movie in
									Text(movie.title)
								}
							}
							.padding(.horizontal)
						}
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
			await vm.loadPopularMovies()
		}
	}
}

#Preview {
	MoviesView()
		.environment(LoginViewModel())
}
