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
    
    var body: some View {
        ZStack {
            
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView(.vertical, showsIndicators: false) {
//                    Text(viewModel.movie.title)
//                        .font(.jakartaBold(14))
//                        .foregroundColor(.black)
                    
                        RemoteImageView(url: URL(string: viewModel.movie.poster), size: .init(width: screenWidth / 2, height: 200))
                            .padding(.top, 20)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(viewModel.movie.genre)
                                .foregroundColor(.black)
                                .font(.jakartaLight(14))
                            
                            Text("Released on: \(viewModel.movie.released)")
                                .foregroundColor(.black)
                                .font(.jakartaLight(14))
                        }
                        .padding(.top, 20)
                    
                    ratingView
                    
                    castView
                    
                    Text(viewModel.movie.plot)
                        .foregroundColor(.black)
                        .font(.jakartaLight(14))
                        .padding(.top, 20)

                }
            }
            .padding(.horizontal, 27)
        }
        .navigationTitle(viewModel.movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .backButton {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var ratingView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button {
                
            } label: {
                HStack {
                    Text("View Rating")
                        .font(.jakartaMedium(13))
                        .foregroundColor(.blue.opacity(0.7))
                    
                    Spacer()
                    
                    Image(.icArrowForward)
                        .renderingMode(.template)
                        .foregroundColor(.blue.opacity(0.7))
                }
                .addBackgroundBorder()
            }
        }
    }
    
    var castView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Cast & Crew")
                .font(.jakartaMedium(14))
                .leftAlign()
            
            Text(viewModel.movie.actors)
                .font(.jakartaLight())
                .foregroundColor(.black)
        }
        .padding(.top)
    }
}
