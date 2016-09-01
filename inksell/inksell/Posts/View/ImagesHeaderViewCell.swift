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
    @IBOutlet weak var FavButton: UIButton!
    
    @IBAction func goBack(sender: AnyObject) {
        self.parentViewControllerDelegate!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addToFav(sender: AnyObject) {
        FavouritesHelper.ToggleFavourite(self.postSummaryEntity!)
        setFavImage()
    }
    
    override func initCell() {
        if(self.postSummaryEntity?.PostDefaultImage != nil) {
            HeaderImage.af_setImageWithURL(NSURL(string: self.postSummaryEntity!.PostDefaultImage!)!)
        }
        PostTitle.text = self.postSummaryEntity?.Title
        PostedOn.text = self.postSummaryEntity?.Postdate?.dateStringWithFormat("MMM d, yyyy")
        setFavImage()
    }
    
    func setFavImage() {
        if(FavouritesHelper.IsFavourite((self.postSummaryEntity?.PostId)!)){
            FavButton.setImage(UIImage(named: "fav_on"), forState: .Normal)
        }
        else{
            FavButton.setImage(UIImage(named: "fav_off"), forState: .Normal)
        }
    }
}