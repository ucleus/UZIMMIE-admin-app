//
//  CustomButton.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/3/24.
//

import SwiftUI

struct CustomButton: View {
    @State var action: () -> Void
    @State var text: String
    @State var buttonColor: Color
    
    var body: some View {
        VStack(spacing: 80.0) {
            Button(action: { action() }) {
                Text(text)
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
            }
            .clipShape(Capsule())
        }
        .buttonStyle(.bordered)
        .font(.title2)
        .tint(buttonColor)
        
    }
}

#Preview {
    CustomButton(action: {}, text: "Sign In", buttonColor: .blue)
}
