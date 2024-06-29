//
//  ImageViewBackgroundViewModifier.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation
import SwiftUI

struct ImageViewBackgroundViewModifier: ViewModifier {
    
    var color: Color
    var size: CGSize
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        ZStack(content: {
                color
            
                content
        })
        .frame(width: size.width, height: size.height)
       // .cornerRadius(cornerRadius)
    }
}

extension View {
    func imageViewBackground(color: Color = Color.gray.opacity(0.3), size: CGSize, cornerRadius: CGFloat = 12) -> some View {
        modifier(ImageViewBackgroundViewModifier(color: color, size: size, cornerRadius: cornerRadius))
    }
}

