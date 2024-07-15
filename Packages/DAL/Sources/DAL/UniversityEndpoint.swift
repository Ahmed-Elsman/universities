//
//  UniversityEndpoint.swift
//  universities
//
//  Created by Ahmed Elsman on 15/07/2024.
//

import Foundation

public struct UniversityEndpoint: APIEndpoint {
    public var path: String {
        return "/search"
    }
    
    public var queryItems: [URLQueryItem] {
        return [URLQueryItem(name: "country", value: "United Arab Emirates")]
    }
    
    public var requestType: RequestType {
        return .get
    }
    
    public var acceptType: AcceptType {
        return .json
    }
    
    public var shouldSaveToDatabase: Bool {
        return true
    }
}
