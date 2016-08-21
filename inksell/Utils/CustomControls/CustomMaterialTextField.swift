//
//  CustomMaterialTextField.swift
//  inksell
//
//  Created by Abhinav Gupta on 21/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomMaterialTextField : UITextField {
    
    override func drawRect(rect: CGRect) {
        
        let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)
        
        let path = UIBezierPath()
        
        path.moveToPoint(startingPoint)
        path.addLineToPoint(endingPoint)
        path.lineWidth = 2.0
        
        tintColor.setStroke()
        
        path.stroke()
    }
}
