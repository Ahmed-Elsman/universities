//
//  APIError.swift
//  challenge05
//
//  Created by Ahmed Elsman on 02/07/2024.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case decodingError
    
    var localizedDescription: String {
        switch self {
        case .invalidResponse:
            return "Invalid response, please check url request or parameters"
        case .decodingError:
            return "Decoding Error, please check model keys carefully"
        }
    }
}
