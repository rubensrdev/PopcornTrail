//
//  SeriesView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 21/2/25.
//

import SwiftUI

struct SeriesView: View {
	@Environment(LoginViewModel.self) private var loginVM
	@State private var vm = SeriesViewModel(repository: SeriesRepositoryPreview())
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
			await vm.loadAllTypesOfSeries()
		}
    }
}

#Preview {
    SeriesView()
		.environment(LoginViewModel())
}
