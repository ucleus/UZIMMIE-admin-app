//
//  AuthManager.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/3/24.
//

import SwiftUI
import FirebaseAuth

class AuthManager: ObservableObject {
    static let shared = AuthManager()
    @Published var isSignedIn = false
    
    var currentUserEmail: String? {
            return Auth.auth().currentUser?.email
        }
    
    // Function to sign in a user with email and password
    func signInWithEmail(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                if let user = authResult?.user {
                    self?.isSignedIn = true
                    print("Sign-in successful, isSignedIn updated to \(String(describing: self?.isSignedIn))")
                    completion(.success(user))
                } else if let error = error {
                    print("Sign-in failed: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }
    }
    
    // Function to register a new user with email and password
    func registerUserWithEmail(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let user = authResult?.user {
                completion(.success(user))
            } else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"])
                completion(.failure(error))
            }
        }
    }
    
    // Function to sign out the current user
    func signOut(completion: @escaping (Bool, Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true, nil)
        } catch let signOutError as NSError {
            completion(false, signOutError)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
