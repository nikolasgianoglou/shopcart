//
//  HomeManager.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import Foundation

protocol HomeManagerProtocol {
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void)
}

class HomeManager: HomeManagerProtocol {
    let webservice: ServiceProtocol
    
    init(webservice: ServiceProtocol = Service()) {
        self.webservice = webservice
    }
    
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void) {
        Service().getProducts(url: AppConstants.Urls.productList, completion: completion)
    }
}
