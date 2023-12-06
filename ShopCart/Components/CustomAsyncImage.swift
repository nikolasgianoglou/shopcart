//
//  CustomAsyncImage.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import SwiftUI

struct CustomAsyncImage: View {
    
    var image: String
    var size: CGFloat
    
    var body: some View {
        Group {
            if let url = URL(string: image) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ZStack {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            
                            .padding(size / 5)

                        ProgressView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .padding(size / 5)
                    .foregroundColor(Color.gray)
            }
        }
        .frame(height: size)
    }
}

struct CustomAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomAsyncImage(image: "breat", size: 50)
    }
}
