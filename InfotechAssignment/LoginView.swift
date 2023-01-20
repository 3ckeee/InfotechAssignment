//
//  LoginView.swift
//  InfotechAssignment
//
//  Created by Erik Kokinda on 20/01/2023.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .shadow(radius: 5.0)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .shadow(radius: 5.0)
            Button(action: {
                // Login logic here
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    // check username and password
                    if self.username == "username" && self.password == "password" {
                        // navigate to next screen
                    } else {
                        self.errorMessage = "Invalid credentials"
                    }
                }
            }) {
                Text("Login")
            }
            Text(errorMessage)
                .foregroundColor(.red)
        }
        .padding()
    }
}
