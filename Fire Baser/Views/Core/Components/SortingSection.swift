//
//  SortingSection.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/13/24.
//

import SwiftUI

struct SortingSection: View {
    @State private var selectedOption: Int = 1 // Default selection

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(1...4, id: \.self) { index in
                Toggle(isOn: Binding(
                    get: { self.selectedOption == index },
                    set: { _ in self.selectedOption = index }
                )) {
                    Text("Option \(index)") // Replace with actual text
                }
            }
        }
    }
}

#Preview {
    SortingSection()
}
