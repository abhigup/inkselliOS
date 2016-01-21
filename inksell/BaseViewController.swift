//
//  BaseViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 21/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit

class BaseViewController : UIViewController {
    
    var passedObject: AnyObject?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
            let viewController = segue.destinationViewController as! BaseViewController;
            viewController.passedObject = sender
        }
        
    func NavigateTo(identifier: String)
    {
        self.performSegueWithIdentifier(identifier, sender: nil)
    }

    func NavigateTo(identifier:String, anyObject: AnyObject)
    {
        self.performSegueWithIdentifier(identifier, sender: anyObject)
    }

}