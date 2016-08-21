//
//  HomeTableViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 21/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import KCFloatingActionButton

class HomeTableController : BaseTableViewController {
    
    var postSummaryItems : [PostSummaryEntity] = [];
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
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
        }
        
        RestClient.get.getPostSummary(AppData.userGuid!, lastPostId: 0, callback: InksellCallback(success: {
            PostSummaryEntities in
            self.items = PostSummaryEntities!
            self.postSummaryItems = PostSummaryEntities!
            self.reloadData()
            }
            , failure: { (ResponseStatus) -> () in
                
        }))
    }
    
    func navigateToNewPost(category: CategoryType)
    {
        self.NavigateToStoryBoard(ScreenName.PostsAddNavController, identifier: ScreenName.PostsAddNavController, anyObject: category.rawValue)
    }
    
    override func getTableCell(indexPath: NSIndexPath) -> UITableViewCell {
        
        if(self.postSummaryItems[indexPath.row].HasPostTitlePic)
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
        if(self.postSummaryItems[indexPath.row].HasPostTitlePic)
        {
            return 160
            
        }
        else
        {
            return 80
        }
        
    }
    
    override func setTableCell(indexPath:NSIndexPath, cell: UITableViewCell) {
        if(self.postSummaryItems[indexPath.row].HasPostTitlePic)
        {
            
            let tableCell = cell as! TableViewCellWithPic
            
            tableCell.TitleImage?.image = nil
            
            tableCell.TitleImage.af_setImageWithURL(NSURL(string: self.postSummaryItems[indexPath.row].PostDefaultImage!)!)
            
            Utilities.setUserImage(self.postSummaryItems[indexPath.row].PostedBy, userImageUri: self.postSummaryItems[indexPath.row].UserImageUrl, imageView: tableCell.UserImage, imageLabel: tableCell.UserImageLabel)
            
            tableCell.Title.text = self.postSummaryItems[indexPath.row].Title
            tableCell.PostedBy.text = self.postSummaryItems[indexPath.row].PostedBy
            tableCell.PostedOn.text = Utilities.getRelativeStringDate(self.postSummaryItems[indexPath.row].Postdate!)
            
        }
        else
        {
            let tableCell = cell as! TableViewCellWithoutPic
            
            tableCell.Title.text = self.postSummaryItems[indexPath.row].Title
            tableCell.PostedBy.text = self.postSummaryItems[indexPath.row].PostedBy
            tableCell.PostedOn.text = Utilities.getRelativeStringDate(self.postSummaryItems[indexPath.row].Postdate!)
            Utilities.setUserImage(self.postSummaryItems[indexPath.row].PostedBy, userImageUri: self.postSummaryItems[indexPath.row].UserImageUrl, imageView: tableCell.UserImage, imageLabel: tableCell.UserImageLabel)
            
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        NavigateToStoryBoard(ScreenName.PostsViewNavController, identifier: ScreenName.PostsViewNavController, anyObject: self.items[row])
        
    }
}
