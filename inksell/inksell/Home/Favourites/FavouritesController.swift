//
//  Favourites.swift
//  inksell
//
//  Created by Abhinav Gupta on 15/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit

class FavouritesController : BasePostSummaryTableViewController {

    @IBAction func handleTabSwipe(recognizer: UISwipeGestureRecognizer) {
        switch(recognizer.direction)
        {
            case UISwipeGestureRecognizerDirection.Left:
                self.tabBarController?.selectedIndex += 1
                break
            case UISwipeGestureRecognizerDirection.Right:
                self.tabBarController?.selectedIndex -= 1
                break
            
            default: break
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            FavouritesHelper.RemoveFromFavourite(self.postSummaryItems[indexPath.row].PostId!)
            viewDidAppear(true)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        self.setPostsSummaryEntities(FavouritesHelper.GetFavourites())
        if(self.postSummaryItems.isEmpty){
            tableView.backgroundView = UIView.loadFromNibNamed("FavouriteEmptyView")
        }
        else{
            tableView.backgroundView = UIView()
        }
    }
}