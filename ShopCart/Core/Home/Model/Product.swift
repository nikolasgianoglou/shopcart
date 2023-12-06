//
//  Product.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import Foundation

struct ProductList: Codable {
    let products: [Product]
}

struct Product: Identifiable, Codable {
    let name: String
    let style, codeColor, colorSlug: String
    let color: String
    let onSale: Bool
    let regularPrice: String
    let actualPrice: String
    let discountPercentage, installments: String
    let image: String
    let sizes: [Size]
    var id = UUID()

    enum CodingKeys: String, CodingKey {
        case name, style
        case codeColor = "code_color"
        case colorSlug = "color_slug"
        case color
        case onSale = "on_sale"
        case regularPrice = "regular_price"
        case actualPrice = "actual_price"
        case discountPercentage = "discount_percentage"
        case installments, image, sizes
    }
}

// MARK: - Size
struct Size: Codable, Identifiable {
    let available: Bool
    let size, sku: String
    let id = UUID()
}
