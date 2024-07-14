//
//  University.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import Foundation

struct University: Codable {
    let name: String
    let country: String
    let alphaTwoCode: String
    
    enum CodingKeys: String, CodingKey {
        case name, country
        case alphaTwoCode = "alpha_two_code"
    }
}
