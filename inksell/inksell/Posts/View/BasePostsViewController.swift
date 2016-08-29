//
//  BasePostsViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 06/03/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class BasePostsViewController : BaseTableViewController {
    
    var postSummaryEntity : PostSummaryEntity?
    var postEntity : IPostEntity?
    var categoryType : CategoryType?

    override func initTableController() {
        self.postSummaryEntity = AppData.passedObject as? PostSummaryEntity
        categoryType = CategoryType(rawValue: (self.postSummaryEntity?.categoryid)!)
        self.tableViewCellIdentifier = [ViewPostsViewType.ImagesHeaderViewCell.rawValue, ViewPostsViewType.CommonViewCell.rawValue, ViewPostsViewType.ContactsViewCell.rawValue]
        self.items = self.tableViewCellIdentifier
    }
    
    override func viewDidAppear(animated: Bool) {
        getPostEntity()
    }
    
    func getPostEntity() {
        RestClient.get.getFullPostEntity((self.postSummaryEntity?.PostId)!, categoryType: categoryType!, callback: InksellCallback<IPostEntity>(success:
                {
                    entity in
                    for index in 0..<self.items.count
                    {
                        let indexPath = NSIndexPath(forRow: index, inSection: 0)
                        let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! BaseViewPostCell
                        cell.initData(self.postSummaryEntity!, postEntity: entity!, viewController: self)
                    }
                }
                , failure: {responseStatus in
            }));
    }
    
    override func getTableCell(indexPath : NSIndexPath) -> UITableViewCell{
        let view = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier[indexPath.row], forIndexPath: indexPath) as! BaseViewPostCell
        return view
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let viewType = ViewPostsViewType(rawValue:self.items[indexPath.row] as! String)!
        switch viewType {
        case .ImagesHeaderViewCell:
            return 350
        case .CommonViewCell:
            return 300
        case .ContactsViewCell:
            return 250
        default:
            return 100
        }
    }
}