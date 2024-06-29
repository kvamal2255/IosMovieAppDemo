//
//  MovieDetailViewModel.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    @Published var movie: Movie
    
    @Published var selectedRating: Rating?
    
    var ratingListAvailable: Bool {
        movie.ratings.count > 1
    }
    init(movie: Movie) {
        self.movie = movie
        if !movie.ratings.isEmpty {
            self.selectedRating = movie.ratings.first
        }
    }
}
