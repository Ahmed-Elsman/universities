//
//  ConfigurationManager.swift
//  challenge05
//
//  Created by Ahmed Elsman on 02/07/2024.
//

import Foundation

class ConfigurationManager {
    static let shared = ConfigurationManager()
    
    private init() {}

    var baseURL: URL {
        return URL(string: "http://universities.hipolabs.com")!
    }
}
