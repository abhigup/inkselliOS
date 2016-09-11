//
//  BaseViewPostCell.swift
//  inksell
//
//  Created by Abhinav Gupta on 28/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class BaseViewPostCell: UITableViewCell {
    
    var postSummaryEntity : PostSummaryEntity?
    var postEntity : IPostEntity?
    var categoryType : CategoryType?
    var parentViewControllerDelegate : BasePostsViewController?
    
    func initCell(){}
    
    final func initData(postSummary:PostSummaryEntity, postEntity: IPostEntity, viewController: BasePostsViewController) {
        self.parentViewControllerDelegate = viewController
        self.postSummaryEntity = postSummary
        self.postEntity = postEntity
        categoryType = CategoryType(rawValue: (self.postSummaryEntity?.categoryid)!)
        
        initCell()
    }
    
    override final func awakeFromNib() {
        super.awakeFromNib()
    }
}