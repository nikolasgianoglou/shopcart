//
//  HomeView.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {

            VStack(spacing: 0) {
                
                
                HStack(spacing: 16) {
                    Spacer()
                    cartIcon
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        ForEach(Filter.allCases, id: \.self) { filter in
                            filterItem(filter: filter)
                        }
                    }
                    .padding()
                }
                
                ScrollView {
                    VStack {
                        ForEach(viewModel.filteredProducts) { prod in
                            HomeCard(product: prod)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

extension HomeView {
    var cartIcon: some View {
        NavigationLink {
            CartView()
        } label: {
            Image(systemName: "cart")
                .foregroundStyle(Color.black.opacity(0.5))
                .frame(width: 50, height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.4), radius: 5)
                }
        }
    }
    func filterItem(filter: Filter) -> some View {
        Button {
            viewModel.selectedFilter = filter
        } label: {
            Text(filter.text)
                .foregroundStyle(viewModel.selectedFilter == filter ? Color.black : Color.black.opacity(0.5))
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(radius: 10)
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
