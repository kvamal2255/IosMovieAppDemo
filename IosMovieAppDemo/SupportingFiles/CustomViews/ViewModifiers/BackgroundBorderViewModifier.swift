//
//  BackgroundBorderViewModifier.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation
import SwiftUI

struct BackgroundBorderViewModifier: ViewModifier {
    
    var cornerRadius = 15.0
    var verticalPadding: CGFloat = 15
    var horizontalPadding: CGFloat = 17
    var backgroundColor: Color = Color.white
    var strokeColor: Color = Color.white
    var borderWidth: CGFloat = 0.5
    var width: CGFloat?
    var height: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .frame(width: width, height: height)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius) .stroke(strokeColor, lineWidth: borderWidth))
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
}

extension View {
    func addBackgroundBorder(verticalPadding: CGFloat = 10, horizontalPadding: CGFloat = 17, backgroundColor: Color = Color.white, strokeColor: Color = Color.blue.opacity(0.5), height: CGFloat? = nil, width: CGFloat? = nil, cornerRadius: CGFloat = 8, borderWidth: CGFloat = 1) -> some View {
        modifier(BackgroundBorderViewModifier(cornerRadius: cornerRadius, verticalPadding: verticalPadding, horizontalPadding: horizontalPadding, backgroundColor: backgroundColor, strokeColor: strokeColor, borderWidth: borderWidth, width: width, height: height))
    }
}

