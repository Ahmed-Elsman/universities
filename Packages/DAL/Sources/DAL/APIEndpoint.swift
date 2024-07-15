//
//  APIEndpoint.swift
//  universities
//
//  Created by Ahmed Elsman on 15/07/2024.
//

import Foundation

public enum RequestType: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum AcceptType: String {
    case json = "application/json"
}

public protocol APIEndpoint {
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var requestType: RequestType { get }
    var acceptType: AcceptType { get }
    var shouldSaveToDatabase: Bool { get }
}

extension APIEndpoint {
    var baseURL: URL {
        return ConfigurationManager.shared.baseURL
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)!
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest {
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = requestType.rawValue
        request.setValue(acceptType.rawValue, forHTTPHeaderField: "Accept")
        return request
    }
}
