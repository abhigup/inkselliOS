//
//  VerifyViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 25/10/15.
//  Copyright © 2015 inksell. All rights reserved.
//

import UIKit

class VerifyViewController: BaseViewController {

    @IBOutlet weak var code: UITextField!
    @IBOutlet weak var VerifyBtn: UIButton!
    
    var isAlreadyRegistered:Bool?
    
    override func initController() {
        let IsAlreadyRegisteredPassedValue = self.passedObject
        if(IsAlreadyRegisteredPassedValue == nil)
        {
            isAlreadyRegistered = PersistentStorage.sharedInstance.getData(StorageConstants.IsAlreadyRegistered)
        }
        else
        {
            isAlreadyRegistered = (IsAlreadyRegisteredPassedValue as! Bool)   
        }
    }
    
    @IBAction func VerifyUser(sender: AnyObject) {
        if(AppData.userGuid.isNilOrEmpty || isAlreadyRegistered==nil)
        {
            view.makeToast(message: "Please register yourself.")
            return
        }
        
        if(code.text.isNilOrEmpty)
        {
            view.makeToast(message: "Verification code cannot be empty")
        }
        
        RestClient.get.verifyUser(AppData.userGuid!, code: code.text!, isAlreadyRegistered: isAlreadyRegistered!, callback: InksellCallback<Int>(success: { responseCode in
                let responseStatus = ResponseStatus(rawValue: responseCode!)
                if(responseStatus == .UserSuccessfullyVerified)
                {
                    self.NavigateToStoryBoard(ScreenName.HomeTab, identifier: ScreenName.HomeTab)
                }
            }))
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
