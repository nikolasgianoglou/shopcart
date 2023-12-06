//
//  PreviewProvider+.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview() ///Singleton
    private init() { }
    
    let product = Product(name: "T-SHIRT",
                          style: "night",
                          codeColor: "%#$%#",
                          colorSlug: "%$%$#%$#",
                          color: "Blue",
                          onSale: true,
                          regularPrice: "R$ 100",
                          actualPrice: "R$ 90",
                          discountPercentage: "10%",
                          installments: "test",
                          image: "breat",
                          sizes: [Size(available: true, size: "P", sku: "gf433t")])
        
        
    
    
}
