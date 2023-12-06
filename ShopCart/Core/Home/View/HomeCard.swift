//
//  HomeCard.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import SwiftUI

struct HomeCard: View {
    var product: Product
    
    var body: some View {
        NavigationLink {
            HomeDetails(product: product)
        } label: {
            VStack {
                CustomAsyncImage(image: product.image, size: 100)
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .bold()
                    
                    HStack {
                        if product.onSale {
                            Text(product.regularPrice)
                                .foregroundStyle(.gray)
                                .strikethrough(true, color: Color.red)
                        }
                        Spacer()
                        Text(product.actualPrice)
                            .bold()
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                }
                .foregroundStyle(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    Color.white
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .shadow(color: .gray.opacity(0.2), radius: 5)
            }
            .overlay(alignment: .topTrailing) {
                if product.onSale {
                    Text("PROMOÇÃO")
                        .lineLimit(1)
                        .foregroundStyle(.black)
                        .font(.subheadline)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.white)
                                .shadow(radius: 10)
                        }
                        .padding(12)
                }
            }
        }
    }
}

struct HomeCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeCard(product: dev.product)
    }
}
