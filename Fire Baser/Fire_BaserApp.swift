//
//  Fire_BaserApp.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/3/24.
//

import SwiftUI
import Firebase

@main
struct Fire_BaserApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthManager.shared)
        }
    }
}
