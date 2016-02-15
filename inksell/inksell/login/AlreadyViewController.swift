//
//  AlreadyViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 25/10/15.
//  Copyright © 2015 inksell. All rights reserved.
//

import UIKit

class AlreadyViewController: BaseViewController {

    @IBOutlet weak var EmailId: UITextField!
    @IBOutlet weak var SubmitBtn: UIButton!
    
    @IBAction func Navigate(sender: UIButton) {
        switch(sender)
        {
        case SubmitBtn:
            if(EmailId.text.isNilOrEmpty)
            {
                view.makeToast(message: "Please provide a valid registered email id.")
                return
            }
            
            RestClient.get.alreadyRegistered(EmailId.text!, callback: InksellCallback<String>(success: {
                guid in
                AppData.userGuid = guid
                PersistentStorage.sharedInstance.saveData(StorageConstants.UserUUID, object: guid)
                PersistentStorage.sharedInstance.saveData(StorageConstants.IsAlreadyRegistered, object: true)
                self.NavigateTo("NavToVerify", anyObject: true)
                }))
        default:
            break
        }
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
