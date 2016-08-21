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
    
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func initTableController() {
        self.tableViewCellIdentifier = [AddPostsViewType.CommonView.rawValue, AddPostsViewType.ImagesView.rawValue, AddPostsViewType.ContactsView.rawValue]
        self.items = [AddPostsViewType.CommonView.rawValue, AddPostsViewType.ImagesView.rawValue, AddPostsViewType.ContactsView.rawValue]
    }
    
    override func getTableCell(indexPath: NSIndexPath) -> UITableViewCell {
        let viewType = self.items[indexPath.row] as! String
        return tableView.dequeueReusableCellWithIdentifier(viewType, forIndexPath: indexPath)
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