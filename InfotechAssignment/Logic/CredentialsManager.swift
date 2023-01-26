//
//  CredentialsManager.swift
//  InfotechAssignment
//
//  Created by Erik Kokinda on 20/01/2023.
//

import Foundation

class CredentialsManager {
    static let shared = CredentialsManager()
    private let defaults = UserDefaults.standard
    
    func storeCredentials(username: String, password: String) {
        defaults.set(username, forKey: "username")
        defaults.set(password, forKey: "password")
    }
    
    func getCredentials() -> (username: String?, password: String?) {
        let username = defaults.string(forKey: "username")
        let password = defaults.string(forKey: "password")
        return (username, password)
    }
}
