//
//  MyAccount.swift
//  inksell
//
//  Created by Abhinav Gupta on 06/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import AlamofireImage
import KCFloatingActionButton

class MyAccountController : BasePostSummaryTableViewController, KCFloatingActionButtonDelegate {
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserOfficialEmail: UILabel!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserImageLabel: UILabel!
    @IBOutlet weak var HeaderView: UIView!
    
    @IBAction func handleTabSwipe(recognizer: UISwipeGestureRecognizer) {
        switch(recognizer.direction)
        {
            case UISwipeGestureRecognizerDirection.Right:
                self.tabBarController?.selectedIndex -= 1
                break
            default: break
        }
    }
    
    override func initSummaryController() {
        setUserData()
        let fabButton = KCFloatingActionButton()
        fabButton.buttonColor = UIColor().pink()
        let image = Utilities.resizeImage(UIImage(named: "edit")!, targetSize: CGSizeMake(30, 30))
        fabButton.buttonImage = image
        fabButton.paddingY = -20
        fabButton.fabDelegate = self
        HeaderView.addSubview(fabButton)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let entity = self.postSummaryItems[indexPath.row]
            RestClient.get.deletePost(entity.PostId!, categoryType: CategoryType(rawValue: entity.categoryid!)!, callback: InksellCallbackHelper.WithExpectedResponseStatus(ResponseStatus.PostDeletedSuccess, onSuccess: {
                self.setUserData()
                AlertController.alert("Post Deleted Successfully")
            }))
        }
    }
    
    func emptyKCFABSelected(fab: KCFloatingActionButton) {
        NavigateTo("NavToUserInfo")
    }
    
    func setUserData()
    {
        Utilities.setUserImage(AppData.userData!.Username, userImageUri: AppData.userData!.UserImageUrl, imageView: UserImage, imageLabel: UserImageLabel)
        UserOfficialEmail.text = AppData.userData!.CorporateEmail
        UserName.text = AppData.userData!.Username
        
        RestClient.get.getMyPostSummary(InksellCallback(success: {
            PostSummaryEntities in
            self.setPostsSummaryEntities(PostSummaryEntities!)
            }
            , failure: { (ResponseStatus) -> () in
                
        }))
    }
}