//
//  BasePostsViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 06/03/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class BasePostsViewController : BaseViewController {
    
    var postSummaryEntity : PostSummaryEntity?
    @IBOutlet weak var PostImages: UIImageView!
    @IBOutlet weak var PostTitle: UILabel!
    @IBOutlet weak var PostDate: UILabel!
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func initController() {
        self.postSummaryEntity = AppData.passedObject as? PostSummaryEntity
        PostImages?.image = nil
        
        PostTitle.text = postSummaryEntity?.Title
        PostDate.text = postSummaryEntity?.Postdate?.dateStringWithFormat("MMM d, yyyy")
    }
}