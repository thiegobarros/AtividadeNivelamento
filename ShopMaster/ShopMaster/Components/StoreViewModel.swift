//
//  Logic.swift
//  ShopMaster
//
//  Created by Barros, Thiego Italo Santos on 10/05/26.
//

import SwiftUI
import Combine
import Foundation

class StoreViewModel: ObservableObject {
    // Produtos mockados
    @Published var products: [Product] = [
        Product(name: "iPhone 15", price: 7999.0, category: "Eletrônicos", imageName: "iphone"),
        Product(name: "MacBook Air", price: 10999.0, category: "Eletrônicos", imageName: "laptopcomputer"),
        Product(name: "Cafeteira", price: 450.0, category: "Casa", imageName: "cup.and.saucer"),
        Product(name: "AirFryer", price: 600.0, category: "Casa", imageName: "cooktop"),
        Product(name: "Tênis Running", price: 350.0, category: "Moda", imageName: "figure.run"),
        Product(name: "Jaqueta Jeans", price: 280.0, category: "Moda", imageName: "tshirt")
    ]
    
    @Published var cartItems: [CartItem] = []
    
    // Categorias únicas para as seções
    var categories: [String] {
        Array(Set(products.map { $0.category })).sorted()
    }
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
    
    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }
    
    func removeFromCart(at offsets: IndexSet) {
        cartItems.remove(atOffsets: offsets)
    }
}
