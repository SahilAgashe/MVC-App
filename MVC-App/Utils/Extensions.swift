//
//  Extensions.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 03/01/24.
//

import UIKit

extension UIColor {
    
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return  UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    static let reminderTheme = UIColor.rgb(248, 243, 254)
    static let reminderButtonTheme = UIColor.rgb(115, 85, 231)

}
