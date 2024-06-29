//
//  MovieCategoryType.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation

enum MovieCategoryType: String, CaseIterable, Identifiable {
    var id: String {
        rawValue
    }
    
    case year
    case genre
    case directors
    case actors
    case allMovies
    
    var title: String {
        switch self {
        case .year:
            return "Year"
        case .genre:
            return "Genre"
        case .directors:
            return "Directors"
        case .actors:
            return "Actors"
        case .allMovies:
            return "All Movies"
        }
    }
}
