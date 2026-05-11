//
//  Cart.swift
//  ShopMaster
//
//  Created by Barros, Thiego Italo Santos on 10/05/26.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: StoreViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.cartItems) { item in
                    HStack {
                        Text("\(item.quantity)x")
                            .bold()
                        Text(item.product.name)
                        Spacer()
                        Text("R$ \(item.product.price * Double(item.quantity), specifier: "%.2f")")
                    }
                }
                .onDelete(perform: viewModel.removeFromCart)
            }
            
            VStack(spacing: 10) {
                Divider()
                HStack {
                    Text("Total:")
                        .font(.title2).bold()
                    Spacer()
                    Text("R$ \(viewModel.totalPrice, specifier: "%.2f")")
                        .font(.title2).foregroundColor(.green).bold()
                }
                .padding()
                
                Button("Finalizar Compra") {
                    // Ação de checkout
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            }
        }
        .navigationTitle("Seu Carrinho")
    }
}
