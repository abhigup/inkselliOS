//
//  BasePostSummaryTableViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 27/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class BasePostSummaryTableViewController: BaseTableViewController {
    
    var postSummaryItems : [PostSummaryEntity] = [];
    
    func initSummaryController() {}
        
    override func initTableController() {
        self.tableViewCellIdentifier = ["TableViewCellWithPic", "TableViewCellWithoutPic"]
        initSummaryController()
    }
    
    func setPostsSummaryEntities(summaryEntities :[PostSummaryEntity]) {
        self.items = summaryEntities
        self.postSummaryItems = summaryEntities
        self.reloadData()
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
    
    override func didSelectAtIndexPath(indexPath:NSIndexPath){
        let row = indexPath.row
        NavigateToStoryBoard(ScreenName.PostsViewNavController, identifier: ScreenName.PostsViewNavController, anyObject: self.items[row])
    }
}