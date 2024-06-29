//
//  DataManager.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation

class DataManager: NSObject {
    
    func loadData() -> [Movie]? {
        if let path = Bundle.main.path(forResource: "MovieData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(filePath: path))
                let decoder = JSONDecoder()
                let movies = try decoder.decode([Movie].self, from: data)
                return movies
            } catch {
                print("Error loading JSON file: \(error)")
            }
        } else {
            print("File not found")
        }
        return nil
    }
    
    func getCategorizedList(_ movies: [Movie], category: MovieCategoryType) -> [String] {
        switch category {
        case .year:
            getYears(movies)
        case .genre:
            getGenres(movies)
        case .directors:
            getDirectors(movies)
        case .actors:
            getActors(movies)
        default:
            fatalError("not expected")
        }
    }
    
    func getFilteredList(_ movies: [Movie], category: MovieCategoryType, text: String) -> [Movie] {
        switch category {
        case .year:
            filterMoviesByYear(text, movies: movies)
        case .genre:
            filterMoviesByGenre(text, movies: movies)
        case .directors:
            filterMoviesByDirector(text, movies: movies)
        case .actors:
            filterMoviesByActor(text, movies: movies)
        default:
            fatalError("not expected")
        }
    }
    
    
    func getYears(_ movies: [Movie]) -> [String] {
        var yearsList = Set<String>()
            
            for movie in movies {
                
                let releaseYears = movie.year.split(separator: "–")
                
                for year in releaseYears {
                    yearsList.insert(String(year))
                }
            }
            
            return Array(yearsList).sorted()
    }
    
    func getGenres(_ movies: [Movie]) -> [String] {
        var genresList = Set<String>()
        
        for movie in movies {
            let genres = movie.genre.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            genresList.formUnion(genres)
        }
        
        return Array(genresList).sorted()
    }
    
    func getDirectors(_ movies: [Movie]) -> [String] {
        var directorsList = Set<String>()
        
        for movie in movies {
            let directors = movie.director.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            for director in directors {
                if director != "N/A" {
                    directorsList.insert(director)
                }
            }
        }
        
        return Array(directorsList).sorted()
    }
    
    func getActors(_ movies: [Movie]) -> [String] {
        var actorsList = Set<String>()
        
        for movie in movies {
            let actors = movie.actors.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            for actor in actors {
                if actor != "N/A" {
                    actorsList.insert(actor)
                }
            }
        }
        
        return Array(actorsList).sorted()
    }
    
    func filterMoviesByYear(_ year: String, movies: [Movie]) -> [Movie] {
         movies.filter { $0.year == year }
    }
    
    func filterMoviesByGenre(_ genre: String, movies: [Movie]) -> [Movie] {
        return movies.filter { movie in
            movie.genre.lowercased().contains(genre.lowercased())
        }
    }
    
    func filterMoviesByDirector(_ director: String, movies: [Movie]) -> [Movie] {
        return movies.filter { movie in
            movie.director.lowercased().contains(director.lowercased())
        }
    }
    
    func filterMoviesByActor(_ actor: String, movies: [Movie]) -> [Movie] {
        return movies.filter { movie in
            movie.actors.lowercased().contains(actor.lowercased())
        }
    }

}
