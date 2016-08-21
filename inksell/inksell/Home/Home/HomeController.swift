//
//  Home.swift
//  inksell
//
//  Created by Abhinav Gupta on 15/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import KCFloatingActionButton

class HomeController : BaseViewController {

    
    @IBOutlet weak var TableContainerView: UIView!
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
    }
    
    override func initController() {
        let fab = KCFloatingActionButton()
        fab.buttonColor = UIColor().pink()
        fab.plusColor = UIColor.whiteColor()
        fab.addItem("Multiple Items", icon: UIImage(named: "multiple")!, handler: { _ in self.navigateToNewPost(CategoryType.Multiple)})
        fab.addItem("Other", icon: UIImage(named: "other")!, handler: { _ in self.navigateToNewPost(CategoryType.Others)})
        fab.addItem("Automobile", icon: UIImage(named: "auto")!, handler: { _ in self.navigateToNewPost(CategoryType.Automobile)})
        fab.addItem("Electronics", icon: UIImage(named: "electronics")!, handler: { _ in self.navigateToNewPost(CategoryType.Electronics)})
        fab.addItem("Real Estate", icon: UIImage(named: "realestate")!, handler: { _ in self.navigateToNewPost(CategoryType.RealEstate)})
        fab.addItem("Furniture", icon: UIImage(named: "furniture")!, handler: { _ in self.navigateToNewPost(CategoryType.Furniture)})
        TableContainerView.addSubview(fab)
        
    }
    
    func navigateToNewPost(category: CategoryType)
    {
        self.NavigateToStoryBoard(ScreenName.PostsAddNavController, identifier: ScreenName.PostsAddNavController, anyObject: category.rawValue)
    }

    
}