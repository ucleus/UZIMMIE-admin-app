//
//  CustomTextField.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/14/24.
//

import SwiftUI

struct CustomTextField: View {
    @State var placeholder: String = "Username"
    @Binding var text: String
    let authManager = AuthManager()
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            
            HStack {
                TextField(placeholder, text: $text)
                    .autocorrectionDisabled(true)
                    .frame(height: 20)
            }
            .padding()
            .overlay(Capsule().stroke(Color.gray, lineWidth: 1))
        }
    }
}

#Preview {
    CustomTextField(text: .constant("Text Binding"))
}
