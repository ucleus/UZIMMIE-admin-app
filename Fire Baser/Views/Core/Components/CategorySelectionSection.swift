//
//  CategorySelectionSection.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/13/24.
//

import SwiftUI

struct CategorySelectionSection: View {
    @ObservedObject var categoryList = CategoryListModel() // Observing for changes
    @State private var selectedCategory: CategoryModel? // Update to use CategoryModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categoryList.categories, id: \.id) { category in
                    Button(action: {
                        selectedCategory = category
                    }) {
                        HStack {
                            if !category.icon.isEmpty {
                                Image(systemName: category.icon) // Assuming you're using SF Symbols
                                    .foregroundColor(.white)
                            }
                            Text(category.name)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(selectedCategory == category ? Color("ThemeColor") : Color.gray)
                        .cornerRadius(10)
                    }
                }
            }
        }
    }
}

#Preview {
    CategorySelectionSection()
}
