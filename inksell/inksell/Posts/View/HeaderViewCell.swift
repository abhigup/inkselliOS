//
//  HeaderViewCell.swift
//  inksell
//
//  Created by Abhinav Gupta on 10/09/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class HeaderViewCell: BaseViewPostCell {
    @IBOutlet weak var PostTitle: UILabel!
    @IBOutlet weak var PostedOn: UILabel!
    @IBOutlet weak var FavButton: UIButton!
    
    @IBAction func goBack(sender: AnyObject) {
        self.parentViewControllerDelegate!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addToFav(sender: AnyObject) {
        FavouritesHelper.ToggleFavourite(self.postSummaryEntity!)
        setFavImage()
    }
    
    override func initCell() {
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