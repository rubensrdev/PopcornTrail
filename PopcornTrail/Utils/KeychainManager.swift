//
//  KeychainManager.swift
//  PopcornTrail
//
//  Created by Rubén Segura Romo on 20/2/25.
//

import Foundation
import Security

/// `KeychainManager` maneja el almacenamiento seguro en Keychain.
struct KeychainManager {
	
	/// Guarda un valor en Keychain con una clave específica.
	static func save(_ value: String, forKey key: String) {
		guard let data = value.data(using: .utf8) else { return }
		
		let query: [String: Any] = [
			kSecClass as String: kSecClassGenericPassword,
			kSecAttrAccount as String: key,
			kSecValueData as String: data,
			kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
		]
		
		SecItemDelete(query as CFDictionary) // Elimina si ya existe para evitar duplicados
		SecItemAdd(query as CFDictionary, nil)
	}
	
	/// Recupera un valor desde Keychain para una clave específica.
	static func retrieve(forKey key: String) -> String? {
		let query: [String: Any] = [
			kSecClass as String: kSecClassGenericPassword,
			kSecAttrAccount as String: key,
			kSecReturnData as String: true,
			kSecMatchLimit as String: kSecMatchLimitOne
		]
		
		var dataTypeRef: AnyObject?
		let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
		
		guard status == errSecSuccess, let data = dataTypeRef as? Data else { return nil }
		return String(data: data, encoding: .utf8)
	}
	
	/// Elimina un valor de Keychain para una clave específica.
	static func delete(forKey key: String) {
		let query: [String: Any] = [
			kSecClass as String: kSecClassGenericPassword,
			kSecAttrAccount as String: key
		]
		SecItemDelete(query as CFDictionary)
	}
}
