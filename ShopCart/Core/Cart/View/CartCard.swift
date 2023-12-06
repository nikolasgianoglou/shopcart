//
//  CartCard.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import SwiftUI

struct CartCard: View {
    @Binding var item: CartItem
    
    var body: some View {
        HStack (spacing: 8) {
            CustomAsyncImage(image: item.product.image, size: 60)
            
            VStack (alignment: .leading) {
                Text(item.product.name)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .font(.title3)
                    .bold()
                
                HStack {
                    Text("Tamanho:")
                    
                    Text(item.size)
                        .bold()
                }
                .font(.subheadline)
                
                if item.product.onSale {
                    HStack(spacing: 6) {
                        Text(item.product.regularPrice)
                            .foregroundStyle(Color.black.opacity(0.6))
                            .strikethrough(true, color: Color.red)
                        Text(item.product.actualPrice)
                            .bold()
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                } else {
                    Text(item.product.regularPrice)
                        .bold()
                }
                
                
            }
            
            Spacer()
            
            CustomStepper(amount: $item.amount) {
                CartViewModel.shared.removeProduct(item: item)
            }

        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.2), radius: 5)
        }
        .foregroundStyle(.black)
    }
}

struct CartCard_Previews: PreviewProvider {
    static var previews: some View {
        CartCard(item: .constant(CartItem(product: dev.product, amount: 1, size: "M")))
    }
}
