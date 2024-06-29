//
//  MovieListView.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import SwiftUI

struct MovieListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: MovieListViewModel
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(viewModel.movies.indices, id: \.self) { index in
                            NavigationLink {
                                MovieDetailView(viewModel: .init(movie: viewModel.movies[index]))
                            } label: {
                                MovieItemView(movie: viewModel.movies[index])
                            }
                        }
                    }
                    .padding(.top, 20)
                }
            }
            .padding(.horizontal, 27)
        }
        .navigationTitle("Movies")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .backButton {
            presentationMode.wrappedValue.dismiss()
        }
        
    }
}
