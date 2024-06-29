//
//  ViewExtension.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import SwiftUI

extension View {
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}

extension View {
    func backButton(leadingPadding: Double = 16, action: @escaping()->()) -> some View {
        self.toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(.icArrowBackward)
                    .onTapGesture {
                        action()
                    }
                    .foregroundColor(.black)
                    .padding(.leading, leadingPadding)
            }
        }
    }
}
