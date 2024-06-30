//
//  Navigator.swift
//  IosMovieAppDemo
//
//  Created by Amal k v on 30/06/24.
//

import Foundation
import SwiftUI

struct Navigator<Content>: View where Content: View {
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        if #available(iOS 16, *) {
            NavigationStack(root: content)
        } else {
            NavigationView(content: content)
        }
    }
}
