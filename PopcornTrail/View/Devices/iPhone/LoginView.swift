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
				} else if vm.isLoggedIn {
					loggedInView
				} else {
					loginOptionsView
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
	
	/// Vista cuando el usuario ha iniciado sesión
	private var loggedInView: some View {
		VStack(spacing: 12) {
			Image(systemName: "checkmark.circle.fill")
				.resizable()
				.scaledToFit()
				.frame(width: 50)
				.foregroundStyle(.green)
			
			Text("Successfully Logged In!")
				.font(.title2)
				.foregroundStyle(.white)
				.fontWeight(.semibold)
		}
		.padding()
	}
	
	/// Vista con opciones de login
	private var loginOptionsView: some View {
		VStack(spacing: 20) {
			DemoView()
			
			Text("Welcome to Popcorn Trail")
				.font(.title)
				.foregroundStyle(.white)
				.fontDesign(.rounded)
				.bold()
			
			loginButton
			registerButton
			guestButton
		}
		.padding(.horizontal)
	}
	
	private var loginButton: some View {
		Button(action: { Task { await vm.login() } }) {
			Text("Login with TMDb")
				.font(.headline)
				.frame(maxWidth: .infinity)
				.padding()
				.background(Color.white.opacity(0.9))
				.foregroundStyle(.purple)
				.clipShape(Capsule())
		}
		.padding(.horizontal)
	}
	
	private var registerButton: some View {
		Button(action: { /* Acción de registro */ }) {
			Text("Register on TMDb")
				.font(.headline)
				.frame(maxWidth: .infinity)
				.padding()
				.background(Color.white.opacity(0.9))
				.foregroundStyle(.purple)
				.clipShape(Capsule())
		}
		.padding(.horizontal)
	}
	
	private var guestButton: some View {
		Button(action: { Task { await vm.loginAsGuest() } }) {
			Text("Continue as Guest")
				.font(.subheadline)
				.italic()
				.underline()
				.foregroundStyle(.white)
		}
		.padding(.top, 5)
	}
}

#Preview {
	LoginView()
		.environment(LoginViewModel())
}
