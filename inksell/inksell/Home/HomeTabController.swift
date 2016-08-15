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
   
    override func viewDidLoad() {
        if(AppData.userData==nil)
        {
            RestClient.get.getUserDetails(AppData.userGuid!, callback: InksellCallback(success: {
                (userEntity: UserEntity?) -> () in
                AppData.userData = userEntity!
                PersistentStorage.sharedInstance.saveData(StorageConstants.UserData, object: AppData.userData!)
                }
                , failure: { (ResponseStatus) -> () in
                    
            }))
        }
    }
}