//
//  NetworkErrors.swift
//  ShopCart
//
//  Created by Nikolas Gianoglou Coelho on 06/12/2023.
//

import Foundation

enum NetworkErrors: LocalizedError {
    case invalidUrl, badRequest, decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl: return "URL inválida."
        case .badRequest: return "Erro na requisição."
        case .decodingError: return "Erro ao decodificar JSON."
        }
    }
}
