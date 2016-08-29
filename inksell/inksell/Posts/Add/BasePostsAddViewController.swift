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
import DKImagePickerController

class BasePostsAddViewController: BaseTableViewController, IImagePickerProtocol {
    var images = [DKAsset]()
    var categoryType: CategoryType = CategoryType.AllCategory
    
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    let postsCallback = InksellCallback<String>(success:
        {
            responseCode in
            AlertController.alert("Post Successfully uploaded")
        }
        , failure: {responseStatus in
    })
    
    func presentImagePickerController(imageView : ImagesAddCell)
    {
        let pickerController = DKImagePickerController()
        pickerController.sourceType = .Both
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            for item in assets {
                self.images.append(item)
            }
            imageView.reloadData()
        }
        self.presentViewController(pickerController, animated: true) {}
    }
    
    override func getTableCell(indexPath : NSIndexPath) -> UITableViewCell{
        let view = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier[indexPath.row], forIndexPath: indexPath)
        if(view is ImagesAddCell)
        {
            let imageView = view as! ImagesAddCell
            imageView.setDelegate(self)
        }
        return view
    }
    
    @IBAction func submitPost(sender: AnyObject) {
        var postEntity : IPostEntity? = nil
        
        let detailsViewIdentifier : String
        if(categoryType == CategoryType.RealEstate){
            detailsViewIdentifier = AddPostsViewType.RealEstateAddCell.rawValue
        }
        else{
            detailsViewIdentifier = AddPostsViewType.CommonAddCell.rawValue
        }
        
        let detailsRow = self.items.indexOf {$0 as! String == detailsViewIdentifier}
        let detailsView = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: detailsRow!, inSection: 0)) as! IAddViewProtocol
        
        let contactsRow = self.items.indexOf {$0 as! String == AddPostsViewType.ContactsAddCell.rawValue}
        let contactsView = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: contactsRow!, inSection: 0)) as! IAddViewProtocol
        
        switch categoryType {
        case .Automobile:
            postEntity = AutomobileEntity()
            break
        case .Electronics:
            postEntity = ElectronicEntity()
            break
        case .Furniture:
            postEntity = FurnitureEntity()
            break
        case .Others:
            postEntity = OtherEntity()
            break
        case .RealEstate:
            postEntity = RealEstateEntity()
            break
        default:
            AlertController.alert("Not Supported Category")
        }
        
        if(detailsView.verifyAndGetData(postEntity!, postCategory: categoryType)){
            if(contactsView.verifyAndGetData(postEntity!, postCategory: categoryType)){
                uploadPost(postEntity!)
            }
        }
    }
    
    private func uploadPost(postEntity : IPostEntity)
    {
        switch categoryType {
        case .Others:
            RestClient.post.addOthersPost(postEntity as! OtherEntity, isMultiple: 0, completionHandler: postsCallback)
            break
        case .Electronics:
            RestClient.post.addElectronicsPost(postEntity as! ElectronicEntity, isMultiple: 0, completionHandler: postsCallback)
            break
        case .Automobile:
            RestClient.post.addAutomobilePost(postEntity as! AutomobileEntity, isMultiple: 0, completionHandler: postsCallback)
            break
        case .Furniture:
            RestClient.post.addFurniturePost(postEntity as! FurnitureEntity, isMultiple: 0, completionHandler: postsCallback)
            break
        default:
            AlertController.alert("Not Supported Category")
        }
    }
    
    override func initTableController() {
        categoryType = CategoryType(rawValue:AppData.passedObject as! Int)!
        self.tableViewCellIdentifier = [AddPostsViewType.CommonAddCell.rawValue, AddPostsViewType.ImagesAddCell.rawValue, AddPostsViewType.ContactsAddCell.rawValue]
        self.items = self.tableViewCellIdentifier
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let viewType : AddPostsViewType = AddPostsViewType(rawValue:self.items[indexPath.row] as! String)!
        switch viewType {
        case .CommonAddCell:
            return 400
        case .ContactsAddCell:
            return 400
        case .ImagesAddCell:
            return 150
        default:
            return 100
        }
    }
}