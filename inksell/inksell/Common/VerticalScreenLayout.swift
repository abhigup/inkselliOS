//
//  VerticalScreenLayout.swift
//  inksell
//
//  Created by Abhinav Gupta on 18/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class VerticalScreenLayout: UIView {
    
    var yOffsets: [CGFloat] = []
    
    init() {
        super.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 0))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        var height: CGFloat = 0
        
        for i in 0..<subviews.count {
            let view = subviews[i] as UIView
            view.layoutSubviews()
            height += yOffsets[i]
            view.frame.origin.y = height
            height += view.frame.height
        }
        
        self.frame.size.height = height
        self.frame.size.width = UIScreen.mainScreen().bounds.width
        
    }
    
    override func addSubview(view: UIView) {
        
        yOffsets.append(view.frame.origin.y)
        super.addSubview(view)
        
    }
    
    func removeAll() {
        
        for view in subviews {
            view.removeFromSuperview()
        }
        yOffsets.removeAll(keepCapacity: false)
        
    }
    
}

