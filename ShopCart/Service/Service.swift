//
//  Service.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import Foundation

protocol ServiceProtocol {
     func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void)
}

class Service: ServiceProtocol {
    func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void) {

        guard let url = URL(string: url.rawValue) else {
            completion(.failure(NetworkErrors.invalidUrl))
            return
        }
        
        // Add call to mock before real API call
        if true {
            guard let list = loadDataFromMock() else { return }
            completion(.success(list))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(NetworkErrors.badRequest))
                return
            }
            guard let list = try? JSONDecoder().decode(ProductList.self, from: data) else {
                completion(.failure(NetworkErrors.badRequest))
                return
            }
            completion(.success(list))
        }.resume()
    }
    
    func loadDataFromMock() -> ProductList? {
        guard let url = Bundle.main.url(forResource: "product", withExtension: "json")
            else {
                print("Json file not found")
                return nil
            }
        
        let data = try? Data(contentsOf: url)
        let list =  try? JSONDecoder().decode(ProductList.self, from: data!)
        return list
    }
}
