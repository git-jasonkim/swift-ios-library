//
//  Color+Enum.swift
//  CraftingGuide
//
//  Created by Jason Kim on 3/17/23.
//

import UIKit

enum Color {
    
    static let craftWhite = UIColor.rgba(r: 255, g: 255, b: 255, a: 1.0)
    static let craftOffWhite = UIColor.rgba(r: 252, g: 252, b: 252, a: 1.0)
    static let craftBlack = UIColor.rgba(r: 0, g: 0, b: 0, a: 1.0)
    
    static let craftAlphaBlack = { (alpha: CGFloat) in
        UIColor.rgba(r: 0, g: 0, b: 0, a: alpha)
    }
    
    static let craftAlphaOffWhite = { (alpha: CGFloat) in
        UIColor.rgba(r: 252, g: 252, b: 252, a: alpha)
    }
    
    static let craftLightRed = UIColor.rgba(r: 255, g: 170, b: 180, a: 1.0)
    static let craftRed = UIColor.rgba(r: 255, g: 99, b: 118, a: 0.33)
    static let craftDeepRed = UIColor.rgba(r: 255, g: 63, b: 87, a: 1.0)
    
    static let craftBlue = UIColor.rgba(r: 35, g: 145, b: 255, a: 1.0)
    static let craftGreen = UIColor.rgba(r: 205, g: 255, b: 150, a: 1.0)

}
