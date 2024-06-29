//
//  Rating.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation

struct Rating: Decodable {
    let source: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
