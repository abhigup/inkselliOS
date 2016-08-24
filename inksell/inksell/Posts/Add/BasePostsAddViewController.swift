//
//  BasePostsAddViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 06/03/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit
import Material

class BasePostsAddViewController: BaseTableViewController {
    
    var categoryType: CategoryType = CategoryType.AllCategory
    
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func submitPost(sender: AnyObject) {
        var postEntity : IPostEntity? = nil
        
        let contactsView = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 2, inSection: 0)) as! ContactsView
        switch categoryType {
        case .Automobile:
            postEntity = AutomobileEntity()
            contactsView.verifyAndGetData(postEntity!, postCategory: categoryType)
            break
        case .Electronics:
            postEntity = ElectronicEntity()
            contactsView.verifyAndGetData(postEntity!, postCategory: categoryType)
            break
        case .Furniture:
            postEntity = FurnitureEntity()
            contactsView.verifyAndGetData(postEntity!, postCategory: categoryType)
            break
        case .Others:
            postEntity = OtherEntity()
            contactsView.verifyAndGetData(postEntity!, postCategory: categoryType)
            break
        case .RealEstate:
            postEntity = RealEstateEntity()
            contactsView.verifyAndGetData(postEntity!, postCategory: categoryType)
            break
        default:
            AlertController.alert("Not Supported Catefory")
        }
    }
    
    override func initTableController() {
        categoryType = CategoryType(rawValue:AppData.passedObject as! Int)!
        self.tableViewCellIdentifier = [AddPostsViewType.CommonView.rawValue, AddPostsViewType.ImagesView.rawValue, AddPostsViewType.ContactsView.rawValue]
        self.items = [AddPostsViewType.CommonView.rawValue, AddPostsViewType.ImagesView.rawValue, AddPostsViewType.ContactsView.rawValue]
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let viewType : AddPostsViewType = AddPostsViewType(rawValue:self.items[indexPath.row] as! String)!
        switch viewType {
        case .CommonView:
            return 400
        case .ContactsView:
            return 400
        case .ImagesView:
            return 100
        default:
            return 100
        }
    }
}