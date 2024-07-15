//
//  APIError.swift
//  universities
//
//  Created by Ahmed Elsman on 15/07/2024.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case decodingError
    case noData
    
    var localizedDescription: String {
        switch self {
        case .invalidResponse:
            return "Invalid response, please check url request or parameters"
        case .decodingError:
            return "Decoding Error, please check model keys carefully"
        case .noData:
            return "No Data Found!"
        }
    }
}
