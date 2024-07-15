//
//  ConfigurationManager.swift
//  universities
//
//  Created by Ahmed Elsman on 15/07/2024.
//

import Foundation

class ConfigurationManager {
    static let shared = ConfigurationManager()
    
    private init() {}

    var baseURL: URL {
        return URL(string: "http://universities.hipolabs.com")!
    }
}
