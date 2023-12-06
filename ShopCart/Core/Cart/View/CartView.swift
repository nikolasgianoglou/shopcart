//
//  CartView.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import SwiftUI

struct CartView: View {
    @StateObject var viewModel = CartViewModel.shared
    @Environment(\.dismiss) var dismiss
    @State var showingAlert = false
    
    var body: some View {
        ZStack {

            VStack(alignment: .center) {
                CustomBackButton()
                .overlay {
                    Text("Carrinho")
                        .font(.title2)
                        .bold()
                }
                
                Spacer()
                
                if !viewModel.products.isEmpty {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach($viewModel.products) { product in
                                CartCard(item: product)
                            }
                        }
                        .padding(.bottom, 100)
                        .padding(16)
                    }
                } else {
                    Text("Carrinho vazio!")
                        .foregroundStyle(.white)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                        }
                }
                
                Spacer()
                
                if !viewModel.products.isEmpty {
                    VStack (spacing: 16) {
                        Divider()
                        
                        HStack(alignment: .center) {
                            Text("Total:")
                            Text(viewModel.getTotalValue())
                                .bold()
                                .font(.title2)
                            
                            Spacer()
                            
                            Button {
                                showingAlert = true
                            } label: {
                                Text("Comprar")
                                    .padding()
                                    .foregroundStyle(.white)
                                    .background {
                                        RoundedRectangle(cornerRadius: 15)
                                    }
                            }
                            .alert(isPresented: $showingAlert) {
                                            Alert(title: Text("Ainda não disponível"), dismissButton: .cancel(Text("OK")))
                                        }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .toolbar(.hidden)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
