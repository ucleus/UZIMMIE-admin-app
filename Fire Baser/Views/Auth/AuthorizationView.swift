//
//  AuthorizationView.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/3/24.
//

import SwiftUI

struct AuthorizationView: View {
    @EnvironmentObject var authManager: AuthManager
    // @StateObject private var authManager = AuthManager.shared
    
    var body: some View {
        NavigationStack {
            if authManager.isSignedIn {
                Dashboard()
            } else {
                AuthView(authManager: AuthManager())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .environment(\.colorScheme, .light)
    }
}

#Preview {
    AuthorizationView()
}
