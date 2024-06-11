//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 08/06/24.
//

import Foundation

struct ProductType: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$ " + price.formatPrice()
    }
}
