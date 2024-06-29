//
//  Movie.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation

struct Movie: Decodable{    
    let title: String
    let year: String
    let released: String
    let runTime: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let language: String
    let country: String
    let awards: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case released = "Released"
        case runTime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
    }
}

/*
 {
     "Title": "Meet the Parents",
     "Year": "2000",
     "Rated": "PG-13",
     "Released": "06 Oct 2000",
     "Runtime": "108 min",
     "Genre": "Comedy, Romance",
     "Director": "Jay Roach",
     "Writer": "Greg Glienna, Mary Ruth Clarke, Greg Glienna (story), Mary Ruth Clarke (story), Jim Herzfeld (screenplay), John Hamburg (screenplay)",
     "Actors": "Robert De Niro, Ben Stiller, Teri Polo, Blythe Danner",
     "Plot": "A Jewish male nurse plans to ask his live-in girl friend to marry him. However, he learns that her strict father expects to be asked for his daughter's hand before she can accept. Thus begins the visit from Hell as the two travel to meet Mom and Dad, who turns out to be former CIA with a lie detector in the basement. Coincidentally, a sister also has announced her wedding to a young doctor. Of course everything that can go wrong, does, including the disappearance of Dad's beloved Himalayan cat, Jinxie.",
     "Language": "English, Thai, Spanish, Hebrew, French",
     "Country": "USA",
     "Awards": "Nominated for 1 Oscar. Another 7 wins & 14 nominations.",
     "Poster": "https://m.media-amazon.com/images/M/MV5BMGNlMGZiMmUtZjU0NC00MWU4LWI0YTgtYzdlNGVhZGU4NWZlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",
     "Ratings": [
       {
         "Source": "Internet Movie Database",
         "Value": "7.0/10"
       },
       {
         "Source": "Rotten Tomatoes",
         "Value": "84%"
       },
       {
         "Source": "Metacritic",
         "Value": "73/100"
       }
     ],
     "Metascore": "73",
     "imdbRating": "7.0",
     "imdbVotes": "310,464",
     "imdbID": "tt0212338",
     "Type": "movie",
     "DVD": "N/A",
     "BoxOffice": "$166,244,045",
     "Production": "Nancy Tenenbaum Productions, Universal Pictures, Tribeca Productions, DreamWorks Pictures",
     "Website": "N/A",
     "Response": "True"
   }
 */
