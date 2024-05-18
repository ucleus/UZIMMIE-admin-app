//
//  IngredientsSelectionSection.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/13/24.
//

import SwiftUI

struct IngredientsSelectionSection: View {
    let ingredients = ["Tees", "Hoodies", "Helmets", "Stickers", "Art"]
    @State private var selectedIngredients = Set<String>()
    
    var body: some View {
        WrapView(items: ingredients, selectedItems: $selectedIngredients)
    }
}

#Preview {
    IngredientsSelectionSection()
}
