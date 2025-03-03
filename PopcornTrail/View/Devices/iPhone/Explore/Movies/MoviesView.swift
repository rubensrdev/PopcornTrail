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
										VStack {
											if let url = movie.posterURL {
												AsyncImage(url: url) { image in
													image.resizable()
														.scaledToFill()
														.frame(width: 150, height: 225)
														.clipShape(RoundedRectangle(cornerRadius: 12))
														.shadow(color: .black.opacity(0.6) ,radius: 8, x: 0, y: 4)
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
											
											Text(movie.title)
												.font(.headline)
												.fontDesign(.rounded)
												.multilineTextAlignment(.center)
												.frame(width: 100)
											
										}
										.padding(8)
									}
								}
								.padding(.horizontal)
							}
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
