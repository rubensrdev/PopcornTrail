//
//  LoginView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 20/2/25.
//

import SwiftUI

struct LoginView: View {
	
	@Environment(LoginViewModel.self) private var vm
	
	var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea()
				.opacity(0.85)
			
			VStack {
				Spacer()
				
				if vm.isAuthenticating {
					ProgressView("Authenticating...")
						.font(.title2)
						.foregroundStyle(.white)
						.padding()
				} else {
					VStack(spacing: 20) {
						LogoInLoginView()
						
						Text("Welcome to Popcorn Trail")
							.font(.title)
							.foregroundStyle(.white)
							.fontDesign(.rounded)
							.bold()
						
						Button(action: { Task { await vm.login() } }) {
							Text("Login with TMDb")
								.font(.headline)
								.frame(maxWidth: .infinity)
								.padding()
								.background(Color.white.opacity(0.9))
								.overlay(gradientOverlay)
								.mask(
									Text("Login with TMDb").font(.headline)
								)
							
						}
						.padding(.horizontal)
						
						Button(action: {
							// TODO: pendiente llevar al usuario al registro
						}) {
							Text("Register on TMDb")
								.font(.headline)
								.frame(maxWidth: .infinity)
								.padding()
								.background(Color.white.opacity(0.9))
								.overlay(gradientOverlay)
								.mask(
									Text("Register on TMDb").font(.headline)
								)
						}
						.padding(.horizontal)
						
						Button(action: { Task { await vm.loginAsGuest() } }) {
							Text("Continue as Guest")
								.font(.subheadline)
								.italic()
								.underline()
								.overlay(.white.opacity(0.8))
								.mask(
									Text("Continue as Guest")
										.font(.subheadline).italic().underline()
								)
						}
						.padding(.top, 5)
					}
					.padding(.horizontal)
				}
				
				Spacer()
				
				if !vm.errorMessage.isEmpty {
					Text(vm.errorMessage)
						.font(.footnote)
						.foregroundStyle(.red)
						.padding(.bottom, 20)
				}
			}
			.padding()
		}
		.animation(.easeInOut, value: vm.isAuthenticating)
	}
	
	/// Degradado aplicado al texto de los botones
	private var gradientOverlay: LinearGradient {
		LinearGradient(
			colors: [.red, .pink, .orange, .yellow, .mint, .green],
			startPoint: .leading,
			endPoint: .trailing
		)
	}
}

#Preview {
	LoginView()
		.environment(LoginViewModel())
}
