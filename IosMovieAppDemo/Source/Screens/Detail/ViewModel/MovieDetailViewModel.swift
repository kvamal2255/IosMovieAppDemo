//
//  MovieDetailViewModel.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    @Published var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
