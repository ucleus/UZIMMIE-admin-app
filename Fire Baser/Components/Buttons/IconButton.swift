//
//  IconButton.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/8/24.
//

import SwiftUI

struct IconButton: View {
    @State var action: () -> Void
    @State var icon: String
    
    var body: some View {
        Button{
            action()
        } label: {
            Image(systemName: icon)
                .foregroundStyle(Color.primary)
                .padding()
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.primary, lineWidth: 1.0))
        }
    }
}

#Preview {
    IconButton(action: {}, icon: "person.fill")
}
