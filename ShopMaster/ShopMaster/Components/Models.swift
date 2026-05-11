//
//  Models.swift
//  ShopMaster
//
//  Created by Barros, Thiego Italo Santos on 10/05/26.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let price: Double
    let category: String
    let imageName: String
}

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}
