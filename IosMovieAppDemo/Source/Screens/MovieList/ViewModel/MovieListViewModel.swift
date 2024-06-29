//
//  MaterialListViewModel.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    
    @Published var movies: [Movie]
    
    init(movies: [Movie]) {
        self.movies = movies
    }
}
