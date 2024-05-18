//
//  CustomSecureField.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/3/24.
//

import SwiftUI

struct CustomSecureField: View {
    @State var placeholder: String = "Username"
    @Binding var text: String
    @State var showData = false
    
    var body: some View {
        HStack {
            Image(systemName: "lock")
            if showData {
                TextField(placeholder, text: $text)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
                    .frame(height: 20)
            } else {
                SecureField(placeholder, text: $text)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
                    .frame(height: 20)
            }
            Spacer()
            Button(action: { showData.toggle() }){
                Image(systemName: showData ? "eyes" : "eyebrow")
                    .foregroundStyle(.black)
            }
        }
        .padding()
        .overlay(Capsule().stroke(Color.gray, lineWidth: 1))
    }
}

//#Preview {
//    CustomSecureField(text: $text)
//}
