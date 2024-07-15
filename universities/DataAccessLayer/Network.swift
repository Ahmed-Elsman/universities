//
//  Network.swift
//  challenge05
//
//  Created by Ahmed Elsman on 02/07/2024.
//

import Foundation

// MARK: - URLSession

protocol URLSessionProtocol {
    func data(from request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {
    func data(from request: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: request)
    }
}

protocol NetworkManaging {
    func fetchData<T: Decodable>(from endpoint: APIEndpoint) async throws -> T
}

struct NetworkManager: NetworkManaging {
    
    private let session: URLSessionProtocol
    private let decoder: JSONDecoder
    
    init(withSession session: URLSessionProtocol? = nil, decoder: JSONDecoder = JSONDecoder()) {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        self.session = session ?? URLSession(configuration: config)
        self.decoder = decoder
    }
    
    func fetchData<T: Decodable>(from endpoint: APIEndpoint) async throws -> T {
        let request = endpoint.request
        
        let (data, response) = try await session.data(from: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw APIError.decodingError
        }
    }
}
