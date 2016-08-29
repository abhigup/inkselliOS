//
//  Home.swift
//  inksell
//
//  Created by Abhinav Gupta on 15/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import KCFloatingActionButton

class HomeController : BaseViewController, UIPopoverPresentationControllerDelegate, FilterToHomeProtocol {

    @IBOutlet weak var TableContainerView: UIView!
    @IBOutlet weak var Search: UIBarButtonItem!
    var filteredCategoryType  = CategoryType.AllCategory
    var tabelViewController : HomeTableViewController?
    
    @IBAction func openFilterPopover(sender: AnyObject) {
        NavigateTo("NavToPopoverFilter", anyObject: filteredCategoryType.rawValue)
    }
        
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
        fab.addItem(CategoryType.Multiple.getString(), icon: CategoryType.Multiple.getIcon(), handler: { _ in self.navigateToNewPost(CategoryType.Multiple)})
        fab.addItem(CategoryType.Others.getString(), icon: CategoryType.Others.getIcon(), handler: { _ in self.navigateToNewPost(CategoryType.Others)})
        fab.addItem(CategoryType.Automobile.getString(), icon: CategoryType.Automobile.getIcon(), handler: { _ in self.navigateToNewPost(CategoryType.Automobile)})
        fab.addItem(CategoryType.Electronics.getString(), icon: CategoryType.Electronics.getIcon(), handler: { _ in self.navigateToNewPost(CategoryType.Electronics)})
        fab.addItem(CategoryType.RealEstate.getString(), icon: CategoryType.RealEstate.getIcon(), handler: { _ in self.navigateToNewPost(CategoryType.RealEstate)})
        fab.addItem(CategoryType.Furniture.getString(), icon: CategoryType.Furniture.getIcon(), handler: { _ in self.navigateToNewPost(CategoryType.Furniture)})
        TableContainerView.addSubview(fab)
        
    }
    
    func navigateToNewPost(category: CategoryType)
    {
        self.NavigateToStoryBoard(ScreenName.PostsAddNavController, identifier: ScreenName.PostsAddNavController, anyObject: category.rawValue)
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    func updateTable(categoryType:CategoryType){
        filteredCategoryType = categoryType
        tabelViewController?.filterTableForCategoryType(categoryType)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let viewController = segue.destinationViewController as! BaseViewController;
        if(segue.identifier == "NavToHomeTable")
        {
            tabelViewController = (viewController as! HomeTableViewController)
        }
        
        if segue.identifier == "NavToPopoverFilter" {
            let filterViewController = viewController as! FilterPopoverController
            filterViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            filterViewController.popoverPresentationController!.delegate = self
            filterViewController.preferredContentSize = CGSize(width: 200, height: 260)
            filterViewController.homeDelegate = self
        }
        viewController.passedObject = sender
    }

    
}