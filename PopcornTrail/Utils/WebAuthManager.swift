import Foundation
import SafariServices
import UIKit

/// `WebAuthManager` maneja la autenticación de TMDb usando `SFSafariViewController`
@MainActor
final class WebAuthManager: NSObject, @preconcurrency SFSafariViewControllerDelegate {
	
	private var completion: ((Bool) -> Void)?
	
	/// Inicia la autenticación con TMDb en un `SFSafariViewController`
	func authenticateUser(with token: String, completion: @escaping (Bool) -> Void) {
		guard let authURL = URL(string: "https://www.themoviedb.org/authenticate/\(token)"),
			  let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
			  let rootVC = windowScene.windows.first?.rootViewController else {
			completion(false)
			return
		}
		
		self.completion = completion
		
		let safariVC = SFSafariViewController(url: authURL)
		safariVC.delegate = self
		rootVC.present(safariVC, animated: true)
	}
	
	/// Se ejecuta cuando el usuario cierra el `SFSafariViewController`
	func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
		completion?(true)
		completion = nil
	}
}
