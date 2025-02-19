//
//  LoginView.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 10/2/25.
//

import SwiftUI

struct LoginView: View {
	
	@Environment(LoginViewModel.self) private var vm
	
    var body: some View {
		ZStack {
			Color.black
				.ignoresSafeArea()
				.opacity(0.8)
			VStack {
				DemoView()
				Text("Welcome to the App")
					.bold()
					.font(.title)
					.foregroundStyle(.white)
					.fontDesign(.rounded)
				
				Button {
					print("Login with TMDb")
					Task {
						await vm.login()
					}
				} label: {
					Text("Login with TMDb")
						.font(.headline)
				}
				.padding(10)
				.foregroundStyle(.purple)
				.background(.white.opacity(0.9))
				.clipShape(Capsule())
				
				Button {
					print("Register on TMDb")
				} label: {
					Text("Register on TMDb")
						.font(.headline)
				}
				.padding(10)
				.foregroundStyle(.purple)
				.background(.white.opacity(0.9))
				.clipShape(Capsule())
				
				Button {
					print("Continue as a guest")
					Task {
						await vm.loginAsGuest()
					}
				} label: {
					Text("Continue as a guest")
						.foregroundStyle(.white)
						.font(.subheadline)
						.underline(pattern: .solid)
						.italic()
				}
				.padding(10)

			}
		}
    }
}

#Preview {
    LoginView()
		.environment(LoginViewModel())
}
