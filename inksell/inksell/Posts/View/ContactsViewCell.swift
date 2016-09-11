//
//  ContactsViewCell.swift
//  inksell
//
//  Created by Abhinav Gupta on 29/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class ContactsViewCell: BaseViewPostCell, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserOfficialEmail: UILabel!
    @IBOutlet weak var ContactName: UILabel!
    @IBOutlet weak var ContactAddress: UILabel!
    @IBOutlet weak var UserImageLabel: UILabel!
    
    var contactAddressEntity :ContactAdressEntity?
    var title :String = ""
    
    override func initCell() {
        var postedBy : String
        var officialEmail : String
        var userImageUrl : String
        
        switch categoryType! {
        case .Automobile:
            let entity = (self.postEntity as! AutomobileEntity)
            title = entity.PostTitle!
            contactAddressEntity = entity.ContactAddress!
            postedBy = entity.PostedBy!
            officialEmail = entity.UserOfficialEmail!
            userImageUrl = entity.UserImageUrl!
            break
        case .Electronics:
            let entity = (self.postEntity as! ElectronicEntity)
            title = entity.PostTitle!
            contactAddressEntity = entity.ContactAddress!
            postedBy = entity.PostedBy!
            officialEmail = entity.UserOfficialEmail!
            userImageUrl = entity.UserImageUrl!
            break
        case .RealEstate:
            let entity = (self.postEntity as! RealEstateEntity)
            title = entity.PostTitle!
            contactAddressEntity = entity.ContactAddress!
            postedBy = entity.PostedBy!
            officialEmail = entity.UserOfficialEmail!
            userImageUrl = entity.UserImageUrl!
            break
        case .Furniture:
            let entity = (self.postEntity as! FurnitureEntity)
            title = entity.PostTitle!
            contactAddressEntity = entity.ContactAddress!
            postedBy = entity.PostedBy!
            officialEmail = entity.UserOfficialEmail!
            userImageUrl = entity.UserImageUrl!
            break
        case .Others:
            let entity = (self.postEntity as! OtherEntity)
            title = entity.PostTitle!
            contactAddressEntity = entity.ContactAddress!
            postedBy = entity.PostedBy!
            officialEmail = entity.UserOfficialEmail!
            userImageUrl = entity.UserImageUrl!
            break
        default:
            return
        }
        
        Utilities.setUserImage(postedBy, userImageUri: userImageUrl, imageView: UserImage, imageLabel: UserImageLabel)
        UserName.text = postedBy
        UserOfficialEmail.text = officialEmail
        ContactName.text = contactAddressEntity!.ContactName
        ContactAddress.text = contactAddressEntity!.Adress
        
        initContactButtons()
    }
    
    private func initContactButtons() {
        if(!contactAddressEntity!.ContactEmail.isNilOrEmpty)
        {
            self.parentViewControllerDelegate?.EmailButton.backgroundColor = UIColor().TitlePrimary()
            self.parentViewControllerDelegate?.EmailButton.addTarget(self, action: #selector(emailAction), forControlEvents: .TouchUpInside)
        }
        if(!contactAddressEntity!.ContactNumber.isNilOrEmpty)
        {
            self.parentViewControllerDelegate?.CallButton.backgroundColor = UIColor().TitlePrimary()
            self.parentViewControllerDelegate?.CallButton.addTarget(self, action: #selector(callAction), forControlEvents: .TouchUpInside)
        }
    }
    
    func emailAction(sender: UIButton!) {
        if( MFMailComposeViewController.canSendMail() ) {
            let mailComposer = MFMailComposeViewController()
            let to = [contactAddressEntity!.ContactEmail!]
            mailComposer.setToRecipients(to)
            
            //Set the subject and message of the email
            mailComposer.setSubject("Re: \(title)")
            self.parentViewControllerDelegate!.presentViewController(mailComposer, animated: true, completion: nil)
        }
    }
    
    func callAction(sender: UIButton!) {
        let phoneNumber = contactAddressEntity!.ContactNumber!
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(phoneNumber)")!)
    }
}