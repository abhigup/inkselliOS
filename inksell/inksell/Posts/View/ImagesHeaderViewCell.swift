//
//  ImagesHeaderViewCell.swift
//  inksell
//
//  Created by Abhinav Gupta on 28/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class ImagesHeaderViewCell: BaseViewPostCell {
    
    @IBOutlet weak var PostTitle: UILabel!
    @IBOutlet weak var PostedOn: UILabel!
    @IBOutlet weak var HeaderImage: UIImageView!
    
    @IBAction func goBack(sender: AnyObject) {
        self.parentViewControllerDelegate!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func initCell() {
        if(self.postSummaryEntity?.PostDefaultImage != nil) {
            HeaderImage.af_setImageWithURL(NSURL(string: self.postSummaryEntity!.PostDefaultImage!)!)
        }
        PostTitle.text = self.postSummaryEntity?.Title
        PostedOn.text = self.postSummaryEntity?.Postdate?.dateStringWithFormat("MMM d, yyyy")
    }
}