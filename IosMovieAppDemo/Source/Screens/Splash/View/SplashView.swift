//
//  ContentView.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import SwiftUI

struct SplashView: View {
    
    @State private var showHome: Bool = false
    
    var body: some View {
        ZStack {
            if showHome {
                HomeView()
            } else {
                contentView
            }
        }
        .onAppear {
            onAppear()
        }
    }
    
    var contentView: some View {
        ZStack {
            Color.blue.opacity(0.5)
                .ignoresSafeArea()
            
            Text("Movie Hub")
                .foregroundColor(.white)
                .font(.jakartaBold(20))
        }
    }
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showHome = true
        }
    }
}

#Preview {
    SplashView()
}
