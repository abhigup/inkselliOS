//
//  Home.swift
//  inksell
//
//  Created by Abhinav Gupta on 15/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit

class HomeController : BaseTableViewController {
    
    @IBOutlet weak var Filter: UIBarButtonItem!
    @IBOutlet weak var Search: UIBarButtonItem!
    
    @IBAction func handleTabSwipe(recognizer: UISwipeGestureRecognizer) {
        switch(recognizer.direction)
        {
            case UISwipeGestureRecognizerDirection.Left:
                self.tabBarController?.selectedIndex += 1
                break
            default: break
        }
    }
    
    override func initTableController() {
        self.tableViewCellIdentifier = ["TableViewCellWithPic", "TableViewCellWithoutPic"]
        if(AppData.userData==nil)
        {
            RestClient.get.getUserDetails(AppData.userGuid!, callback: InksellCallback(success: {
                userEntity in
                AppData.userData = userEntity
                }
                , failure: { (ResponseStatus) -> () in
                    
            }))
            
            RestClient.get.getPostSummary(AppData.userGuid!, lastPostId: 0, callback: InksellCallback(success: {
                PostSummaryEntities in
                self.items = PostSummaryEntities!
                self.reloadData()
                }
                , failure: { (ResponseStatus) -> () in
                    
            }))
        }
    }
    
    override func getTableCell(indexPath: NSIndexPath) -> UITableViewCell {
        
        if(self.items[indexPath.row].HasPostTitlePic)
        {
            return tableView.dequeueReusableCellWithIdentifier(self.tableViewCellIdentifier[0], forIndexPath: indexPath)
        }
        else
        {
            return tableView.dequeueReusableCellWithIdentifier(self.tableViewCellIdentifier[1], forIndexPath: indexPath)
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if(self.items[indexPath.row].HasPostTitlePic)
        {
            return 160
            
        }
        else
        {
            return 80
        }

    }
    
    override func setTableCell(indexPath:NSIndexPath, cell: UITableViewCell) {
        if(self.items[indexPath.row].HasPostTitlePic)
        {
            
            let tableCell = cell as! TableViewCellWithPic
            tableCell.TitleImage?.image = nil
            
            tableCell.TitleImage.af_setImageWithURL(NSURL(string: self.items[indexPath.row].PostDefaultImage!)!)
            
            Utilities.setUserImage(self.items[indexPath.row].PostedBy, userImageUri: self.items[indexPath.row].UserImageUrl, imageView: tableCell.UserImage, imageLabel: tableCell.UserImageLabel)
            
            tableCell.Title.text = self.items[indexPath.row].Title
            tableCell.PostedBy.text = self.items[indexPath.row].PostedBy
            tableCell.PostedOn.text = Utilities.getRelativeStringDate(self.items[indexPath.row].Postdate!)
            
        }
        else
        {
            let tableCell = cell as! TableViewCellWithoutPic
            
            tableCell.Title.text = self.items[indexPath.row].Title
            tableCell.PostedBy.text = self.items[indexPath.row].PostedBy
            tableCell.PostedOn.text = Utilities.getRelativeStringDate(self.items[indexPath.row].Postdate!)
            Utilities.setUserImage(self.items[indexPath.row].PostedBy, userImageUri: self.items[indexPath.row].UserImageUrl, imageView: tableCell.UserImage, imageLabel: tableCell.UserImageLabel)

        }
    }
}