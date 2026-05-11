//
//  Store.swift
//  ShopMaster
//
//  Created by Barros, Thiego Italo Santos on 10/05/26.
//

import SwiftUI

struct StoreView: View {
    @StateObject var viewModel = StoreViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.categories, id: \.self) { category in
                    Section(header: Text(category)) {
                        ForEach(viewModel.products.filter { $0.category == category }) { product in
                            HStack {
                                Image(systemName: product.imageName)
                                    .frame(width: 30)
                                Text(product.name)
                                Spacer()
                                Text("R$ \(product.price, specifier: "%.2f")")
                                Button(action: { viewModel.addToCart(product: product) }) {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.green)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Minha Loja")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CartView(viewModel: viewModel)) {
                        Image(systemName: "cart.fill")
                            .overlay(
                                Text("\(viewModel.cartItems.count)")
                                    .font(.caption2).bold()
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 10, y: -10)
                                    .opacity(viewModel.cartItems.isEmpty ? 0 : 1)
                            )
                    }
                }
            }
        }
    }
}
