//
//  File.swift
//  inksell
//
//  Created by Abhinav Gupta on 15/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit

class SubscriptionController : BaseViewController {
    @IBAction func handleTabSwipe(recognizer: UISwipeGestureRecognizer) {
        switch(recognizer.direction)
        {
            case UISwipeGestureRecognizerDirection.Left:
                self.tabBarController?.selectedIndex += 1
                break
            case UISwipeGestureRecognizerDirection.Right:
                self.tabBarController?.selectedIndex -= 1
                break
            
            default: break
        }
    }
    
    override func initController() {
        let emptyView = UIView.loadFromNibNamed("SubscriptionEmptyView")!
            emptyView.frame = view.frame
        view.addSubview(emptyView)
    }
    
}