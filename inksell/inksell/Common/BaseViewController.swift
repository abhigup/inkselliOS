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
    
    func NavigateToViewController(viewController : UIViewController)
    {
        self.navigationController?.pushViewController(viewController, animated: false)
    }
    
    func NavigateToStoryBoard(storyBoard:String, identifier: String, withBackButton: Bool)
    {
        NavigateToStoryBoard(storyBoard, identifier: identifier, anyObject: [], withBackButton: withBackButton)
    }
    
    func NavigateToStoryBoard(storyBoard:String, identifier: String, anyObject:AnyObject, withBackButton: Bool)
    {
        let storyboard = UIStoryboard(name: storyBoard, bundle: anyObject as? NSBundle)
        let vc = storyboard.instantiateViewControllerWithIdentifier(identifier)
        AppData.passedObject = anyObject
        presentViewController(vc, animated: true, completion: nil)
    }
    
    func initController(){}
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.barTintColor = UIColor().TitlePrimaryDark()
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        initController()
        super.viewDidLoad()
    }

}