//
//  HomeViewModel.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var selectedFilter: Filter = .all
    var manager: HomeManagerProtocol
    
    init(manager: HomeManagerProtocol = HomeManager()) {
        self.manager = manager
        getProductList()
    }
}

extension HomeViewModel {
    var filteredProducts: [Product] {
        var filteredProducts: [Product] = self.products
        if selectedFilter == .onSale {
            filteredProducts = filteredProducts.filter { $0.onSale }
        }
        
        return filteredProducts
    }
    func getProductList() {
        guard products.isEmpty else { return }
        manager.getProductList { result in
            switch result {
            case .success(let list):
                DispatchQueue.main.async {
                    self.products = list.products
                }
            case .failure(let error): print("error: \(error)")
            }
        }
    }
}
