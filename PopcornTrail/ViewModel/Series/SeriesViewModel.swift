//
//  SeriesViewModel.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 4/3/25.
//

import Foundation

/// Este view model maneja la lógica de negocio para la vista de series
@Observable
final class SeriesViewModel {
	
	/// Repositorio de series
	let seriesRepository: SeriesRepositoryProtocol
	/// Lista de series populares
	var popularSeries: [Serie] = []
	/// Lista de series más valoradas
	var topRatedSeries: [Serie] = []
	/// Lista de series en emisión
	var onTheAirSeries: [Serie] = []
	/// Estado de carga
	var isLoading = false
	/// Mensaje de error
	var errorMessage = ""
	
	init(seriesRepository: SeriesRepositoryProtocol = SeriesRepository()) {
		self.seriesRepository = seriesRepository
	}
	
	/// Carga los listados de series que se muestran en la UI
	@MainActor
	func loadAllTypesOfSeries() async {
		isLoading = true
		await loadPopularSeries()
		await loadTopRatedSeries()
		await loadOnTheAirSeries()
		isLoading = false
	}
	
	/// Carga las series populares
	@MainActor
	private func loadPopularSeries() async {
		do {
			popularSeries = try await seriesRepository.getPopularSeries()
		} catch let error as NetworkError {
			errorMessage = error.errorDescription ?? "An error occurred."
		} catch {
			errorMessage = "An error occurred: \(error.localizedDescription)"
		}
	}
	
	/// Carga las series más valoradas
	@MainActor
	private func loadTopRatedSeries() async {
		do {
			topRatedSeries = try await seriesRepository.getTopRatedSeries()
		} catch let error as NetworkError {
			errorMessage = error.errorDescription ?? "An error occurred."
		} catch {
			errorMessage = "An error occurred: \(error.localizedDescription)"
		}
	}
	
	/// Carga las series en emisión
	@MainActor
	private func loadOnTheAirSeries() async {
		do {
			onTheAirSeries = try await seriesRepository.getOntheAirSeries()
		} catch let error as NetworkError {
			errorMessage = error.errorDescription ?? "An error occurred."
		} catch {
			errorMessage = "An error occurred: \(error.localizedDescription)"
		}
	}
}
