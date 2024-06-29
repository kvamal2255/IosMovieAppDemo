//
//  CustomHstack.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation
import SwiftUI

struct LeftAlignedStack: ViewModifier {
    func body(content: Content) -> some View {
        HStack(spacing: 0) {
            content
            
            Spacer()
        }
    }
}

extension View {
    func leftAlign() -> some View {
        modifier(LeftAlignedStack())
    }
}
