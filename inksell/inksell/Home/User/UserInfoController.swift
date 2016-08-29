//
//  UserInfoController.swift
//  inksell
//
//  Created by Abhinav Gupta on 27/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class UserInfoController: BaseViewController {
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserOfficialEmail: UILabel!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserImageLabel: UILabel!
    
    @IBOutlet weak var PersonalEmail: UITextField!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var City: UITextField!
    
    
    override func initController() {
        setUserData()
    }
    
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func submitChanges(sender: AnyObject) {
        AppData.userData?.PersonalEmail = PersonalEmail.text
        AppData.userData?.PhoneNumber = PhoneNumber.text
        AppData.userData?.Address = Address.text
        AppData.userData?.City = City.text
        
        RestClient.post.createUpdateUserData(InksellCallback<String>(success:
            {
                responseCode in
                PersistentStorage.sharedInstance.saveData(StorageConstants.UserData, object: AppData.userData!)
                AlertController.alert("User Info Successfully updated")
            }
            , failure: {responseStatus in
        }));
    }
    
    func setUserData()
    {
//        RestClient.get.getUserDetails(InksellCallback(success: {
//            userEntity in
//            AppData.userData = userEntity
//            PersistentStorage.sharedInstance.saveData(StorageConstants.UserData, object: AppData.userData)
//            }
//            , failure: { (ResponseStatus) -> () in
//                
//        }))

        Utilities.setUserImage(AppData.userData!.Username, userImageUri: AppData.userData!.UserImageUrl, imageView: UserImage, imageLabel: UserImageLabel)
        UserOfficialEmail.text = AppData.userData!.CorporateEmail
        UserName.text = AppData.userData!.Username
        PersonalEmail.text = AppData.userData?.PersonalEmail
        PhoneNumber.text = AppData.userData?.PhoneNumber
        Address.text = AppData.userData?.Address
        City.text = AppData.userData?.City        
    }
}