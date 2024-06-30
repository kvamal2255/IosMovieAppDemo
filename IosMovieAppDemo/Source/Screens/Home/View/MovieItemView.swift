//
//  MovieItemView.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import SwiftUI

struct MovieItemView: View {
    
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            
            RemoteImageView(url: URL(string: movie.poster), size: .init(width: 80, height: 100))
            
            VStack(alignment: .leading, spacing: 15) {
                Text(movie.title)
                    .foregroundColor(.black)
                    .font(.jakartaMedium(14))
                
                HStack(alignment: .top) {
                    Text("Language:")
                        .foregroundColor(.black)
                        .font(.jakartaLight(13))
                    
                    Text(movie.language)
                        .foregroundColor(.black)
                        .font(.jakartaLight(13))
                        .multilineTextAlignment(.leading)
                }
                
                Text("Year:  \(movie.year)")
                    .foregroundColor(.black)
                    .font(.jakartaLight(13))

            }
            
            Spacer()
        }
    }
}
