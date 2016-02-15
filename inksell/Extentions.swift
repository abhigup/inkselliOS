//
//  Extentions.swift
//  inksell
//
//  Created by Abhinav Gupta on 24/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

protocol OptionalString {}
extension String: OptionalString {}

extension Optional where Wrapped: OptionalString {
    var isNilOrEmpty: Bool {
        return ((self as? String) ?? "").isEmpty
    }
}

extension String{
    var isNilOrEmpty: Bool {
        return (self ?? "").isEmpty
    }
}

extension UITabBarController {
        func setupSwipeGestureRecognizers(cycleThroughTabs: Bool = false) {
            let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipeLeft:")
            swipeLeftGestureRecognizer.direction = .Left
            self.tabBar.addGestureRecognizer(swipeLeftGestureRecognizer)
            
            let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipeRight:")
            swipeRightGestureRecognizer.direction = .Right
            self.tabBar.addGestureRecognizer(swipeRightGestureRecognizer)
        }
        
        func handleSwipeLeft(gesture: UIGestureRecognizer) {
            self.selectedIndex -= 1
        }
        
        func handleSwipeRight(gesture: UIGestureRecognizer) {
            self.selectedIndex += 1
        }
    
    }

