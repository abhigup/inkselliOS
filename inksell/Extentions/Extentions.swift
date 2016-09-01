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
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[Range(start..<end)]
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UITabBarController {
        func setupSwipeGestureRecognizers(cycleThroughTabs: Bool = false) {
            let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(UITabBarController.handleSwipeLeft(_:)))
            swipeLeftGestureRecognizer.direction = .Left
            self.tabBar.addGestureRecognizer(swipeLeftGestureRecognizer)
            
            let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(UITabBarController.handleSwipeRight(_:)))
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

extension NSDate {
    func dateStringWithFormat(format: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(self)
    }
}

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}

