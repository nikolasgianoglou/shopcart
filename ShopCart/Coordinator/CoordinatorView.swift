//
//  CoordinatorView.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//


import Foundation
import SwiftUI

struct CoordinatorView: View {
    @StateObject var viewModel = CoordinatorViewModel.shared
    
    var body: some View {
        NavigationView {
            switch viewModel.uiState {
            case .home: HomeView()
            }
        }
    }
}
