//
//  CategorySection.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/13/24.
//

import SwiftUI

enum Category: String, CaseIterable {
    case tees = "Tees"
    case hoodies = "Hoodies"
    case bracelets = "Bracelets"
    case helmets = "Helmets"
    case art = "Art"
    case stickers = "Stickers"
}

struct CategorySection: View {
    @State private var selectedCategory: Category? = .tees
    
    var body: some View {
        GroupBox {
            VStack {
                ForEach(Category.allCases, id: \.self) { category in
                    HStack {
                        Text(category.rawValue)
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName: selectedCategory == category ? "circle.inset.filled" : "circle")
                            .foregroundColor(selectedCategory == category ? .black : .gray)
                    }
                    .onTapGesture {
                        selectedCategory = category
                    }
                    .padding(.vertical, 4)
                }
            }
            .padding()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CategorySection()
}
