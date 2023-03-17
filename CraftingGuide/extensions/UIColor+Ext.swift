//
//  UIColor+Ext.swift
//  CraftingGuide
//
//  Created by Jason Kim on 3/17/23.
//

import UIKit

extension UIColor {
    
    static func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
}
