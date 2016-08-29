//
//  HomeTabController.swift
//  inksell
//
//  Created by Abhinav Gupta on 06/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class HomeTabController: UITabBarController {
    
    @IBAction func handleTabSwipe(recognizer: UISwipeGestureRecognizer) {
        switch(recognizer.direction)
        {
        case UISwipeGestureRecognizerDirection.Right:
            self.selectedIndex += 1
            break
        case UISwipeGestureRecognizerDirection.Left:
            self.selectedIndex -= 1
            break
        default: break
        }
    }
}