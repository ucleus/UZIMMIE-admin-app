//
//  AuthView.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/6/24.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var authManager: AuthManager
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showRegister = false
    @State private var errorText = ""

    var body: some View {
        VStack {
            Spacer()
            Text(showRegister ? "Register" : "Welcome")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(Color("ThemeColor"))
            
            NavigationLink(destination: Dashboard(), isActive: $authManager.isSignedIn) {
                EmptyView()
            }
            CustomEmailTextField(placeholder: showRegister ? "Email" : "Username", text: $email)
            CustomSecureField(placeholder: "Password", text: $password)
            
            if showRegister {
                CustomSecureField(placeholder: "Confirm Password", text: $confirmPassword)
            }
            
            if !errorText.isEmpty {
                Text(errorText).foregroundColor(.red)
            }
            
            if showRegister {
                // Register Button
                CustomButton(action: {
                    registerUser()
                }, text: "Register", buttonColor: Color.green)
                
            } else {
                CustomButton(action: {
                    signIn()
                }, text: "Sign In", buttonColor: Color("ThemeColor"))
            }
            
            // Get to Register button
            CustomButton(
                action: { showRegister.toggle() },
                text: showRegister ? "Sign In" : "Register",
                buttonColor: Color.black
            )
            Spacer()
        }
        .padding()
    }
    
    private func signIn() {
        authManager.signInWithEmail(email: email, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    print("Signed in successfully")
                    errorText = ""
                case .failure(let error):
                    errorText = error.localizedDescription
                }
            }
        }
    }
    
    private func registerUser() {
        if password == confirmPassword {
            authManager.registerUserWithEmail(email: email, password: password) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(_):
                        print("Registered successfully")
                        errorText = ""
                        showRegister = false
                    case .failure(let error):
                        errorText = error.localizedDescription
                    }
                }
            }
        } else {
            errorText = "Passwords do not match"
        }
    }
}

#Preview {
    AuthView(authManager: AuthManager())
}
