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
        self.tableViewCellIdentifier = "TableViewCell"
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
    
    override func setTableCell(indexPath:NSIndexPath, cell: UITableViewCell) {
        let tableCell = cell as! TableViewCell
        tableCell.Title.text = self.items[indexPath.row].Title
    }
}