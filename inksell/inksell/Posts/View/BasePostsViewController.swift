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
    
    @IBOutlet weak var EmailButton: UIButton!
    @IBOutlet weak var CallButton: UIButton!
    var postSummaryEntity : PostSummaryEntity?
    var postEntity : IPostEntity?
    var categoryType : CategoryType?

    override func initTableController() {
        self.postSummaryEntity = AppData.passedObject as? PostSummaryEntity
        categoryType = CategoryType(rawValue: (self.postSummaryEntity?.categoryid)!)
        
        var headerViewCell = ViewPostsViewType.HeaderViewCell.rawValue
        if(self.postSummaryEntity?.HasPostTitlePic == true)
        {
            headerViewCell = ViewPostsViewType.ImagesHeaderViewCell.rawValue
        }
        
        var bodyViewCell = ViewPostsViewType.CommonViewCell.rawValue
        if(categoryType == CategoryType.RealEstate)
        {
            bodyViewCell = ViewPostsViewType.RealEstateViewCell.rawValue
        }
        
        self.tableViewCellIdentifier = [headerViewCell, bodyViewCell, ViewPostsViewType.ContactsViewCell.rawValue]
        self.items = self.tableViewCellIdentifier
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    override func viewDidAppear(animated: Bool) {
        getPostEntity()
    }
    
    func getPostEntity() {
        RestClient.get.getFullPostEntity((self.postSummaryEntity?.PostId)!, categoryType: categoryType!, callback: InksellCallback<IPostEntity>(success:
                {
                    entity in
                    self.postEntity = entity;
                    let cells = self.tableView.visibleCells
                    for cell in cells
                    {
                        let cell = cell as! BaseViewPostCell
                        cell.initData(self.postSummaryEntity!, postEntity: entity!, viewController: self)
                    }
                }
                , failure: {responseStatus in
            }));
    }
    
    override func getTableCell(indexPath : NSIndexPath) -> UITableViewCell{
        let view = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier[indexPath.row], forIndexPath: indexPath) as! BaseViewPostCell
        if(postEntity != nil)
        {
            view.initData(self.postSummaryEntity!, postEntity: postEntity!, viewController: self)
        }
        view.contentView.setNeedsLayout()
        view.contentView.layoutIfNeeded()
        return view
    }
}