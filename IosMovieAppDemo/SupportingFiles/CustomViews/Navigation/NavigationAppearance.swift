//
//  NavigationAppearance.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import UIKit

struct NavigationAppearance {
    static func setThemeNavigationStyle() {
        
        //        NavigationAppearance.setTransparentNavigationStyle(theme: theme)
        
        // this is not the same as manipulating the proxy directly
        let appearance = UINavigationBarAppearance()
        
        // this overrides everything you have set up earlier.
        //appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = UIColor.clear
        
        // this only applies to big titles
        appearance.largeTitleTextAttributes = [
            .font : UIFont.jakartaBold(16),
            .foregroundColor : UIColor.black
        ]
        // this only applies to small titles
        appearance.titleTextAttributes = [
            .font : UIFont.jakartaBold(16),
            .foregroundColor : UIColor.black
        ]
        
        let backImage = UIImage(named: "ic.arrow.backward")
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        
        //In the following two lines you make sure that you apply the style for good
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        // This property is not present on the UINavigationBarAppearance
        // object for some reason and you have to leave it til the end
        UINavigationBar.appearance().tintColor = .black
    }
}
