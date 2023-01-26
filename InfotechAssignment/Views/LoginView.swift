//
//  LoginView.swift
//  InfotechAssignment
//
//  Created by Erik Kokinda on 20/01/2023.
//

import Foundation
import SwiftUI


struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var isLogged = false
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .shadow(radius: 5.0)
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5.0)
                    .shadow(radius: 5.0)
                Button(action: simulateLogin) {
                    Text("Login")
                }
                .padding()
                if isLoading {
                    ActivityIndicator(isAnimating: $isLoading, style: .large)
                }
                if isLogged {
                    NavigationLink(destination: MasterView(), isActive: $isLogged) {
                        Text("")
                    }
                }
            }
        }
    }
    func simulateLogin() {
        isLoading = true
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            self.isLogged = true
            self.isLoading = false
        }
    }
}

