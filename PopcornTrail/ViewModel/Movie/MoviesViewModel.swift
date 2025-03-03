//
//  MoviesViewModel.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 3/3/25.
//

import Foundation

/// Este view model maneja la lógica de negocio para la vista de películas
@Observable
final class MoviesViewModel {
	
	/// Repositorio de películas
	private let repository: MovieRepositoryProtocol
	/// Lista de películas populares
	var popularMovies: [Movie] = []
	/// Estado de carga
	var isLoading = false
	/// Mensaje de error
	var errorMessage = ""
	
	init(repository: MovieRepositoryProtocol = MovieRepository()) {
		self.repository = repository
	}
	
	/// Carga las películas populares y actualiza el estado de la vista
	@MainActor
	func loadPopularMovies() async {
		isLoading = true
		do {
			popularMovies = try await repository.getPopularMovies()
			print("Popular movies loaded count: \(popularMovies.count)")
		} catch let error as NetworkError {
			errorMessage = error.errorDescription ?? "An error occurred."
		} catch {
			errorMessage = "An error occurred: \(error.localizedDescription)"
		}
		isLoading = false
	}
	
}
