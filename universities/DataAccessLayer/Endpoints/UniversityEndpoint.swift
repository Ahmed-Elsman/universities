//
//  UniversityEndpoint.swift
//  universities
//
//  Created by Ahmed Elsman on 15/07/2024.
//

import Foundation

struct UniversityEndpoint: APIEndpoint {
    var path: String {
        return "/search"
    }
    
    var queryItems: [URLQueryItem] {
        return [URLQueryItem(name: "country", value: "United Arab Emirates")]
    }
    
    var requestType: RequestType {
        return .get
    }
    
    var acceptType: AcceptType {
        return .json
    }
    
    var shouldSaveToDatabase: Bool {
        return true
    }
}
