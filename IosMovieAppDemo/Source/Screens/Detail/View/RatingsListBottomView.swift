//
//  RatingsListBottomView.swift
//  IosMovieAppDemo
//
//  Created by Amal k v on 30/06/24.
//

import SwiftUI

struct RatingsListBottomView: View {
    
    var ratingsList: [Rating]
    @Binding var viewerShown: Bool
    @Binding var selectedRating: Rating?
    
    var body: some View {
        if viewerShown {
            ZStack {
                Color.black.opacity(0.2).ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    VStack {
                        
                        topView
                       
                        ForEach(ratingsList.indices, id: \.self) { index in
                            Text(ratingsList[index].source)
                                .foregroundColor(.black)
                                .font(.jakartaLight(14))
                                .padding(.vertical, 5)
                                .onTapGesture {
                                    withAnimation {
                                        selectedRating = ratingsList[index]
                                        viewerShown = false
                                    }
                                }
                        }
                    }
                    .padding(.bottom, 40)
                    .padding(.horizontal, 30)
                    .frame(width: screenWidth)
                    .background(Color.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    
                }
                .ignoresSafeArea(edges: .bottom)
            }
        } else {
            EmptyView()
        }
    }
    
    var topView: some View {
        ZStack {
            Text("Select Rating")
                .foregroundColor(.black)
                .font(.jakartaMedium(14))
            
            HStack {
                Spacer()
                
                Button {
                    withAnimation {
                        viewerShown = false
                    }
                } label: {
                    Text("Done")
                        .foregroundColor(.blue)
                        .font(.jakartaMedium(13))
                }
            }
        }
        .padding(.vertical)
    }
}
