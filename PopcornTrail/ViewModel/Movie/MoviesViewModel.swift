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
	/// Lista de películas más valoradas
	var topRatedMovies: [Movie] = []
	/// Lista de películas en cartelera
	var nowPlayingMovies: [Movie] = []
	/// Lista de películas de próximos estrenos
	var upcomingMovies: [Movie] = []
	/// Estado de carga
	var isLoading = false
	/// Mensaje de error
	var errorMessage = ""
	
	init(repository: MovieRepositoryProtocol = MovieRepository()) {
		self.repository = repository
	}
	
	@MainActor
	func loadAllTypesOfMovies() async {
		isLoading = true
		await loadPopularMovies()
		await loadTopRatedMovies()
		await loadNowPlayingMovies()
		await loadUpcomingMovies()
		isLoading = false
	}
	
	/// Carga las películas populares
	@MainActor
	private func loadPopularMovies() async {
		do {
			popularMovies = try await repository.getPopularMovies()
		} catch let error as NetworkError {
			errorMessage = error.errorDescription ?? "An error occurred."
		} catch {
			errorMessage = "An error occurred: \(error.localizedDescription)"
		}
	}
	
	/// Carga las películas más valoradas
	@MainActor
	private func loadTopRatedMovies() async {
		do {
			topRatedMovies = try await repository.getTopRatedMovies()
		} catch let error as NetworkError {
			errorMessage = error.errorDescription ?? "An error occurred."
		} catch {
			errorMessage = "An error occurred: \(error.localizedDescription)"
		}
	}
	
	/// Carga las películas más valoradas
	@MainActor
	private func loadNowPlayingMovies() async {
		do {
			nowPlayingMovies = try await repository.getNowPlayingMovies()
		} catch let error as NetworkError {
			errorMessage = error.errorDescription ?? "An error occurred."
		} catch {
			errorMessage = "An error occurred: \(error.localizedDescription)"
		}
	}
	
	/// Carga las películas que se estrenan próximamente
	@MainActor
	private func loadUpcomingMovies() async {
		do {
			upcomingMovies = try await repository.getUpcomingMovies()
		} catch let error as NetworkError {
			errorMessage = error.errorDescription ?? "An error occurred."
		} catch {
			errorMessage = "An error occurred: \(error.localizedDescription)"
		}
	}
	
}
