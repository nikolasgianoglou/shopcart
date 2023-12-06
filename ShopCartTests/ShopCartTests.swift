//
//  ShopCartTests.swift
//  ShopCartTests
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import XCTest
@testable import ShopCart

class ServiceMock: ServiceProtocol {
    
    
    func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void) {
        guard let jsonData = loadDataFromMock() else {
            completion(.failure(NetworkErrors.badRequest))
            return
        }
        guard let list = try? JSONDecoder().decode(ProductList.self, from: jsonData) else {
            completion(.failure(NetworkErrors.decodingError))
            return
        }
        completion(.success(list))
    }
    
    func loadDataFromMock() -> Data? {
        guard let url = Bundle.main.url(forResource: "product", withExtension: "json")
            else {
                print("Json file not found")
                return nil
            }
        
        let data = try? Data(contentsOf: url)
        return data
    }
}

final class desafioAleloTests: XCTestCase {

    func test_filter_sales() {
        let viewModel = HomeViewModel(manager: HomeManager(webservice: ServiceMock()))
        viewModel.selectedFilter = .onSale
        let containsRegularProducts = viewModel.filteredProducts.contains(where: { !$0.onSale })
        XCTAssertFalse(containsRegularProducts, "Should be false to show no regular products are included, only on sale.")
    }
    
    
    func test_total_prices_calculation() {
        let viewModel = CartViewModel.shared
        let mockProducts = mock_cart
        viewModel.products = mockProducts
        let productsTotalEqualsExpected = viewModel.getTotalValue() == "R$ 810,00"
        XCTAssertTrue(productsTotalEqualsExpected, "Should be true if the total price is correct (using mock)")
    }
    
    func test_repeated_products_rule() {
        let viewModel = CartViewModel.shared
        let mockProduct = mock_cart[0]
        viewModel.addProduct(item: mockProduct)
        viewModel.addProduct(item: mockProduct)
        XCTAssertTrue(viewModel.products.count == 1, "Should be true if repeated products are not beaing added again, which is correct")
    }
    
    func test_remove_button() {
        let viewModel = CartViewModel.shared
        let mockProducts = mock_cart
        viewModel.products = mockProducts
        viewModel.removeProduct(item: mockProducts[0])
        let viewModelContainsRemovedProduct = viewModel.products.contains(where: { $0 == mockProducts[0] })
        XCTAssertFalse(viewModelContainsRemovedProduct, "Should be false if the product was successfully removed")
    }
}

let mock_cart = [
    CartItem(product: Product(name: "T-SHIRT",
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
                              sizes: [Size(available: true, size: "P", sku: "gf433t")]), amount: 1, size: "PP"),
    CartItem(product: Product(name: "T-SHIRT",
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
                              sizes: [Size(available: true, size: "P", sku: "gf433t")]), amount: 3, size: "P"),
    CartItem(product: Product(name: "T-SHIRT",
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
                              sizes: [Size(available: true, size: "P", sku: "gf433t")]), amount: 5, size: "U")
]
