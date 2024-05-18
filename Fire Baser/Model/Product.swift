//
//  Product.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/7/24.
//

import Foundation

// Product model adapted for initialization from Firestore dictionary
struct Product {
    var productID: String
    var productTitle: String
    var productDescription: String
    var productCategory: String
    var productPrice: Double
    var productSizes: [String: Int]
    var productColors: [String: Int]
    var imageUrl: String

    init?(dictionary: [String: Any]) {
        guard let productID = dictionary["productID"] as? String,
              let productTitle = dictionary["productTitle"] as? String,
              let productDescription = dictionary["productDescription"] as? String,
              let productCategory = dictionary["productCategory"] as? String,
              let productPrice = dictionary["productPrice"] as? Double,
              let productSizes = dictionary["productSizes"] as? [String: Int],
              let productColors = dictionary["productColors"] as? [String: Int],
              let imageUrl = dictionary["firstImage"] as? String else {
            return nil
        }
        self.productID = productID
        self.productTitle = productTitle
        self.productDescription = productDescription
        self.productCategory = productCategory
        self.productPrice = productPrice
        self.productSizes = productSizes
        self.productColors = productColors
        self.imageUrl = imageUrl
    }
}
