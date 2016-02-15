//
//  MyAccount.swift
//  inksell
//
//  Created by Abhinav Gupta on 06/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import AlamofireImage

class MyAccountController : BaseViewController {
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserOfficialEmail: UILabel!
    @IBOutlet weak var UserName: UILabel!
    
    @IBAction func handleTabSwipe(recognizer: UISwipeGestureRecognizer) {
        switch(recognizer.direction)
        {
            case UISwipeGestureRecognizerDirection.Right:
                self.tabBarController?.selectedIndex -= 1
                break
            default: break
        }
    }
    
    override func initController() {
        if(AppData.userData==nil)
        {
            RestClient.get.getUserDetails(AppData.userGuid!, callback: InksellCallback(success: {
                userEntity in
                AppData.userData = userEntity
                self.setUserData()
                }
                , failure: { (ResponseStatus) -> () in
                    
            }))
        }
        else
        {
            setUserData()
        }
    }
    
    func setUserData()
    {
        Utilities.setUserImage(AppData.userData!.Username, userImageUri: AppData.userData!.UserImageUrl, imageView: UserImage)
        UserOfficialEmail.text = AppData.userData!.CorporateEmail
        UserName.text = AppData.userData!.Username
    }
}