//
//  LineView.swift
//  inksell
//
//  Created by Abhinav Gupta on 28/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation

import UIKit

enum LineAxis:Int {
    case Vertical,
    Horizontal
}

@IBDesignable
class LineView: UIView {
    
    @IBInspectable var lineWidth: CGFloat = 1.0
    @IBInspectable var lineColor: UIColor? {
        didSet {
            lineCGColor = lineColor?.CGColor
        }
    }
    @IBInspectable var lineMargin :CGFloat = 10.0
    @IBInspectable var lineAxis: Int {
        get {
            return self.axis.rawValue
        }
        set( shapeIndex) {
            self.axis = LineAxis(rawValue: shapeIndex) ?? .Vertical
        }
    }
    
    var axis:LineAxis = .Vertical
    var lineCGColor: CGColorRef?
    
    override func drawRect(rect: CGRect) {
        let lineYCoordinate = self.bounds.size.height - 5
        let LineXCoordinate = self.bounds.size.width - 5
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, lineWidth)
        if let lineCGColor = self.lineCGColor {
            CGContextSetStrokeColorWithColor(context, lineCGColor)
        }
        else {
            CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        }
        if(axis == .Vertical)
        {
            CGContextMoveToPoint(context, 0.0 + lineMargin, lineYCoordinate)
            CGContextAddLineToPoint(context, self.bounds.size.width - lineMargin, lineYCoordinate)
        }
        else
        {
            CGContextMoveToPoint(context, LineXCoordinate, 0.0 + lineMargin)
            CGContextAddLineToPoint(context, LineXCoordinate, self.bounds.size.height - lineMargin)
        }
        
        CGContextStrokePath(context)
    }
}