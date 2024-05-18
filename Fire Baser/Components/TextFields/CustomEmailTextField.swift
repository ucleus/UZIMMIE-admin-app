//
//  CustomTextField.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/3/24.
//

import SwiftUI

struct CustomEmailTextField: View {
    @State var placeholder: String = "Username"
    @State var icon: String = "person"
    @Binding var text: String
    @State private var isValid = true
    let authManager = AuthManager()
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            if !isValid {
                Text("Email formmat isn't correct")
                    .font(.footnote)
                    .foregroundStyle(.red)
                    .padding(.trailing)
            }
            HStack {
                Image(systemName: icon)
                TextField(placeholder, text: $text)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .frame(height: 20)
            }
            .padding()
            .overlay(Capsule().stroke(isValid ? Color.gray : Color.red, lineWidth: 1))
            .onChange(of: text) {
                if text.isEmpty {
                    isValid = true
                } else {
                    isValid = authManager.isValidEmail(text)
                }
            }
        }
    }
}

#Preview {
    CustomTextField(text: .constant("Email Binding"))
}
