//
//  AddProductViewModel.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/17/24.
//

import Foundation

class AddProductViewModel: ObservableObject {
    @Published var productSizes: [ProductSize] = []
    @Published var productColors: [ProductColor] = []

    func addSize() {
        productSizes.append(ProductSize(size: "", count: 0))
    }

    func addColor() {
        productColors.append(ProductColor(color: "", count: 0))
    }
}

struct ProductSize: Identifiable {
    let id = UUID()
    var size: String
    var count: Int
}

struct ProductColor: Identifiable {
    let id = UUID()
    var color: String
    var count: Int
}
