//
//  MaterialDetailView.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: MovieDetailViewModel
    @State private var isExpand: Bool = false
    @State private var showRatings: Bool = false
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView(.vertical, showsIndicators: false) {
                    HStack(alignment: .top) {
                        RemoteImageView(url: URL(string: viewModel.movie.poster), size: .init(width: 150, height: 200))
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(viewModel.movie.title)
                                .font(.jakartaBold(15))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            
                            Text(viewModel.movie.genre)
                                .foregroundColor(.black)
                                .font(.jakartaLight(13))
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                            
                            Text(viewModel.movie.language)
                                .foregroundColor(.black)
                                .font(.jakartaLight(13))
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                            
                            Text(viewModel.movie.released)
                                .foregroundColor(.gray.opacity(0.8))
                                .font(.jakartaLight(12))
                            
                        }
                        
                        Spacer()
                    }
                    .frame(height: 200)
                    .padding(.top, 20)
                    
                    castView
                    
                    ratingView
                    
                    Text(getExpandableText())
                        .foregroundColor(.black)
                        .font(.jakartaLight(14))
                        .leftAlign()
                        .onTapGesture {
                            guard viewModel.movie.plot.count > 100 else { return }
                            isExpand.toggle()
                        }
                        .padding(.top, 15)
                }
            }
            .padding(.horizontal, 27)
        }
        .navigationTitle("Movie Detail")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .backButton {
            presentationMode.wrappedValue.dismiss()
        }
        .overlay(RatingsListBottomView(ratingsList: viewModel.movie.ratings, viewerShown: $showRatings, selectedRating: $viewModel.selectedRating))
    }
    
    var ratingView: some View {
        HStack {
            Text("Rating: ")
                .font(.jakartaMedium(14))
                .foregroundColor(.black)
            
            if viewModel.movie.ratings.isEmpty {
                Text("NA")
                    .font(.jakartaLight(13))
                    .foregroundColor(.black)
            } else {
                HStack {
                    Text(viewModel.selectedRating?.source ?? "NA")
                        .font(.jakartaLight(13))
                        .foregroundColor(.black)
                    
                    if viewModel.ratingListAvailable {
                        Image(.icArrowDownward)
                    }
                        
                }
                .addBackgroundBorder()
                .onTapGesture {
                    guard viewModel.ratingListAvailable else { return }
                    withAnimation {
                        showRatings = true
                    }
                }
            }
            
            Text(viewModel.selectedRating?.value ?? "NA")
                .font(.jakartaLight(13))
                .foregroundColor(.black.opacity(0.8))
                .addBackgroundBorder()
            
            Spacer()
        }
        .padding(.top)
    }
    
    var castView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Cast & Crew")
                .font(.jakartaMedium(14))
                .leftAlign()
            
            Text(viewModel.movie.actors)
                .font(.jakartaLight(14))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
        }
        .padding(.top)
    }
    
    func getExpandableText() -> String {
        if viewModel.movie.plot.count > 100 {
            if isExpand {
                return viewModel.movie.plot + "...view less"
            } else {
                return String(viewModel.movie.plot.prefix(100)) + "...view more"
            }
        }
        return viewModel.movie.plot
    }
}
