//
//  MyColors.swift
//  inksell
//
//  Created by Abhinav Gupta on 23/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit
import Material

extension UIColor{
    
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.startIndex.advancedBy(1)
            let hexColor = hexString.substringFromIndex(start)
            
            if hexColor.characters.count == 8 {
                let scanner = NSScanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexLongLong(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
    
    static func randomColor() -> UIColor {
        let r = CGFloat.random()
        let g = CGFloat.random()
        let b = CGFloat.random()
        
        // If you wanted a random alpha, just create another
        // random number for that too.
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    func Transparent() -> UIColor{
        return UIColor(hexString: "#ffffff00")!
    }
    
    func TitlePrimaryDark() -> UIColor{
        return UIColor(hexString: "#01579Bff")!
    }
    
    func TitlePrimary() -> UIColor{
        return UIColor(hexString: "#0277BDff")!    }
    
    func pink() -> UIColor{
        return UIColor(hexString: "#f50057ff")!    }
    
    func pink_pressed() -> UIColor{
        return UIColor(hexString: "#f50048ff")!    }
    
    func DarkGreyColor() -> UIColor{
        return MaterialColor.grey.darken1
    }
    
    func LightGreyColor() -> UIColor{
        return MaterialColor.grey.lighten3
    }
}