//
//  ImageButton.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/14/24.
//

import SwiftUI

struct ImageButton: View {
    @State var action: () -> Void
    var color: Color = .gray
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Upload Product Images")
            Button(action: action) {
                Image(systemName: "plus.app.fill")
                    .font(.system(size: 30))
                    .foregroundColor(color)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 250, height: 80) // Set the button's size here.
            .background(
                RoundedRectangle(cornerRadius: 10) // Applies rounded corners.
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [10])) // Custom dashed stroke.
                    .foregroundColor(color)
            )
        .padding() // Optional: adds padding around the button to prevent clipping
        }
    }
}

#Preview {
    ImageButton(action: {})
}
