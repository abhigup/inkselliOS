//
//  HomeTableViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 21/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import KCFloatingActionButton

class HomeTableViewController : BasePostSummaryTableViewController {
    
    override func initSummaryController() {
        RestClient.get.getPostSummary(0, callback: InksellCallback(success: {
            PostSummaryEntities in
                self.setPostsSummaryEntities(PostSummaryEntities!)
            }
            , failure: { (ResponseStatus) -> () in
                
        }))
    }
    
    func navigateToNewPost(category: CategoryType)
    {
        self.NavigateToStoryBoard(ScreenName.PostsAddNavController, identifier: ScreenName.PostsAddNavController, anyObject: category.rawValue)
    }
    
    func filterTableForCategoryType(categoryType : CategoryType) {
        if(categoryType == CategoryType.AllCategory)
        {
            initSummaryController()
            return
        }
        
        RestClient.get.getFilteredPostSummary(0, categoryType: categoryType, callback: InksellCallback(success: {
            PostSummaryEntities in
            self.setPostsSummaryEntities(PostSummaryEntities!)
            }
            , failure: { (ResponseStatus) -> () in
                
        }))
    }
}
