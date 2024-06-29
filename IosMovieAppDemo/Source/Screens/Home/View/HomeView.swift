//
//  HomeView.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @State private var searchText: String = ""
    @State private var selectedCategory: MovieCategoryType?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    searchBox
                    
                    if viewModel.filteredMovies.isEmpty {
                        VStack {
                            Spacer()
                            
                            Text("No results found.")
                                .foregroundColor(.gray.opacity(0.9))
                                .font(.jakartaLight(14))
                            
                            Spacer()
                        }
                        
                    } else {
                        ScrollView {
                            if searchText.isEmpty {
                                movieCategoryView
                            } else {
                                movieList
                                    .padding(.horizontal, 27)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Movie Database")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.getData()
            }
        }
    }
    
    var searchBox: some View {
        HStack {
            Image(.icSearch)
            
            TextField("Search movie by title/actor/genre/director", text: $searchText)
                .foregroundColor(.black)
                .font(.jakartaMedium(13))
                .onChange(of: searchText) {
                    searchMovie()
                }
        }
        .padding(.horizontal)
        .frame(width: screenWidth - (27 * 2), height: 44)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal, 27)
    }
    
    var movieCategoryView: some View {
        ForEach(MovieCategoryType.allCases) { category in
            HStack {
                Text(category.title)
                    .foregroundColor(.black)
                    .font(.jakartaMedium(15))
                
                Spacer()
                
                Image(selectedCategory == category ? .icArrowDownward : .icArrowForward)
                    .resizable()
                    .frame(width: 10, height: 10)
            }
            .padding(.vertical, 5)
            .background(Color.white)
            .onTapGesture {
                withAnimation {
                    if selectedCategory != category {
                        selectedCategory = category
                        return
                    }
                    selectedCategory = nil
                }
            }
            
            if selectedCategory == category {
                if selectedCategory == .allMovies {
                    movieList
                } else {
                    movieFilterList
                }
            }
            
            Divider()
        }
        .padding(.horizontal, 27)
    }
    
    var movieList: some View {
        VStack(spacing: 15) {
            ForEach(viewModel.filteredMovies.indices, id: \.self) { index in
                MovieItemView(movie: viewModel.filteredMovies[index])
            }
        }
    }
    
    var movieFilterList: some View {
        VStack {
            generateList(viewModel.getList(self.selectedCategory))
        }
    }
    
    func generateList(_ items: [String]) -> some View {
        ForEach(items.indices, id: \.self) { index in
            NavigationLink {
                MovieListView(viewModel: .init(movies: viewModel.getFilteredMovies(with: items[index], category: self.selectedCategory)))
            } label: {
                Text(items[index])
                    .font(.jakartaLight(14))
                    .foregroundColor(.black)
                    .padding(.vertical, 5)
                    .leftAlign()
            }
        }
    }
}

//MARK: Functions

extension HomeView {
    func searchMovie() {
        viewModel.searchAction(with: searchText)
    }
}

#Preview {
    HomeView()
}
