//
//  UIView+Ext.swift
//  CraftingGuide
//
//  Created by Jason Kim on 3/10/22.
//

import Foundation
import UIKit

extension UIView {
 
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeading: CGFloat, paddingBottom: CGFloat, paddingTrailing: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }

        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
 
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
        }
    }
    
    func anchor(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeading: CGFloat, paddingBottom: CGFloat, paddingTrailing: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        anchor(top: top, leading: leading, bottom: bottom, trailing: trailing, paddingTop: paddingTop, paddingLeading: paddingLeading, paddingBottom: paddingBottom, paddingTrailing: paddingTrailing, width: width, height: height)
    }
    
}
