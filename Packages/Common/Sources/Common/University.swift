//
//  University.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import Foundation
import RealmSwift

public class University: Object, Codable {
    @objc dynamic public var name: String = ""
    @objc dynamic public var country: String = ""
    @objc dynamic public var alphaTwoCode: String = ""

    enum CodingKeys: String, CodingKey {
        case name, country
        case alphaTwoCode = "alpha_two_code"
    }
}
