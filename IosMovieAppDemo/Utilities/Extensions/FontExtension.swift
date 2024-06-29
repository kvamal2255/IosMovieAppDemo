//
//  FontExtension.swift
//  MovieDatabaseDemo
//
//  Created by Amal k v on 29/06/24.
//

import Foundation
import SwiftUI

extension Font {
    
    static func font(name: String, with size: CGFloat) -> Font {
        Font.custom(name, size: size)
    }
    
    static func jakartaBold(_ size: CGFloat = 12) -> Font {
        Font.font(name: "PlusJakartaSans-Bold", with: size)
    }
    
    static func jakartaSemiBold(_ size: CGFloat = 12) -> Font {
        Font.font(name: "PlusJakartaSans-SemiBold", with: size)
    }
    
    static func jakartaMedium(_ size: CGFloat = 12) -> Font {
        Font.font(name: "PlusJakartaSans-Medium", with: size)
    }
    
    static func jakartaLight(_ size: CGFloat = 12) -> Font {
        Font.font(name: "PlusJakartaSans-Light", with: size)
    }
}

extension UIFont {
    static func font(name: String, with size: CGFloat) -> UIFont {
        UIFont(name: name, size: size)!
    }
    
    static func jakartaBold(_ size: CGFloat = 12) -> UIFont {
        font(name: "PlusJakartaSans-Bold", with: size)
    }
    
    static func jakartaSemiBold(_ size: CGFloat = 12) -> UIFont {
        font(name: "PlusJakartaSans-SemiBold", with: size)
    }
    
    static func jakartaMedium(_ size: CGFloat = 12) -> UIFont {
        font(name: "PlusJakartaSans-Medium", with: size)
    }
    
    static func jakartaLight(_ size: CGFloat = 12) -> UIFont {
        font(name: "PlusJakartaSans-Light", with: size)
    }
    
    static func jakartaRegular(_ size: CGFloat = 12) -> UIFont {
        font(name: "PlusJakartaSans-Regular", with: size)
    }
}
