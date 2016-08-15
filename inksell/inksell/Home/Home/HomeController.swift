//
//  Home.swift
//  inksell
//
//  Created by Abhinav Gupta on 15/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import KCFloatingActionButton

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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
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
            self.reloadData()
            }
            , failure: { (ResponseStatus) -> () in
                    
        }))
        let fab = KCFloatingActionButton()
        fab.buttonColor = UIColor().pink()
        fab.plusColor = UIColor.whiteColor()
        fab.addItem("Multiple Items", icon: UIImage(named: "multiple")!, handler: { _ in self.navigateToNewPost(CategoryType.Multiple)})
        fab.addItem("Other", icon: UIImage(named: "other")!, handler: { _ in self.navigateToNewPost(CategoryType.Others)})
        fab.addItem("Automobile", icon: UIImage(named: "automobile")!, handler: { _ in self.navigateToNewPost(CategoryType.Automobile)})
        fab.addItem("Electronics", icon: UIImage(named: "electronics")!, handler: { _ in self.navigateToNewPost(CategoryType.Electronics)})
        fab.addItem("Real Estate", icon: UIImage(named: "realestate")!, handler: { _ in self.navigateToNewPost(CategoryType.RealEstate)})
        fab.addItem("Furniture", icon: UIImage(named: "furniture")!, handler: { _ in self.navigateToNewPost(CategoryType.Furnitureterminal)})
        tableView.addSubview(fab)
    }
        
    func navigateToNewPost(category: CategoryType)
    {
        
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        NavigateToStoryBoard("PostsView", identifier: "PostsView", anyObject: self.items[row], withBackButton: true)
        
    }
}