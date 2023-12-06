//
//  CustomStepper.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import SwiftUI

struct CustomStepper: View {
    @Binding var amount: Int
    var onRemove: (() -> Void)?
    
    var body: some View {
        HStack (spacing: 8) {
            Button {
                if amount > 1 {
                    amount -= 1
                } else {
                    onRemove?()
                }
            } label: {
                Image(systemName: "minus")
                    .foregroundStyle(Color.white)
                    .frame(width: 20, height: 20)
                    .background {
                        Circle()
                            .fill(Color.black.opacity(0.7))
                    }
            }
            
            
            Text("\(amount)")
                .font(.title3)
            
            Button {
                amount += 1
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(Color.white)
                    .frame(width: 20, height: 20)
                    .background {
                        Circle()
                            .fill(Color.black.opacity(0.7))
                    }
            }
        }
    }
}

struct CustomStepper_Previews: PreviewProvider {
    static var previews: some View {
        CustomStepper(amount: .constant(1))
    }
}
