//
//  ShowResultsButton.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/13/24.
//

import SwiftUI

struct ShowResultsButton: View {
    var body: some View {
        Button("Показать блюда") {
            // Action to show results
        }
        .padding()
        .background(Color.red)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

#Preview {
    ShowResultsButton()
}
