//
//  University.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import Foundation
import RealmSwift

class University: Object, Codable {
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var alphaTwoCode: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name, country
        case alphaTwoCode = "alpha_two_code"
    }
}
