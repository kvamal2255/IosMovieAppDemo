//
//  HomeViewModel.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    var movies: [Movie] = []
    @Published var filteredMovies: [Movie] = []
    
    func getData() {
        if let movies = DataManager().loadData() {
            DispatchQueue.main.async {
                self.movies = movies
                self.filteredMovies = movies
            }
        }
    }
    
    func getList(_ category: MovieCategoryType?) -> [String]{
        guard let category else { return [] }
        return DataManager().getCategorizedList(self.movies, category: category)
    }
    
    func getFilteredMovies(with item: String, category: MovieCategoryType?) -> [Movie] {
        guard let category else { return [] }
        return DataManager().getFilteredList(self.movies, category: category, text: item)
    }
    
    //MARK: Search Action
    
    func searchAction(with text: String) {
        func resetSearch() {
            filteredMovies = movies
        }
        if text.isEmpty {
            resetSearch()
        } else {
            self.filteredMovies = movies.compactMap({ movie in
                if movie.title.lowercased().contains(text.lowercased()) ||               movie.actors.lowercased().contains(text.lowercased()) ||
                    movie.director.lowercased().contains(text.lowercased()) ||
                    movie.genre.lowercased().contains(text.lowercased()) {
                    return movie
                }
                return nil
            })
        }
    }
}
