//
//  ContactsViewCell.swift
//  inksell
//
//  Created by Abhinav Gupta on 29/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class ContactsViewCell: BaseViewPostCell {
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserOfficialEmail: UILabel!
    @IBOutlet weak var ContactName: UILabel!
    @IBOutlet weak var ContactAddress: UILabel!
    @IBOutlet weak var UserImageLabel: UILabel!
    
    override func initCell() {
        var contactAddressEntity :ContactAdressEntity
        var postedBy : String
        var officialEmail : String
        var userImageUrl : String
        
        switch categoryType! {
        case .Automobile:
            let entity = (self.postEntity as! AutomobileEntity)
            contactAddressEntity = entity.ContactAddress!
            postedBy = entity.PostedBy!
            officialEmail = entity.UserOfficialEmail!
            userImageUrl = entity.UserImageUrl!
            break
        case .Electronics:
            let entity = (self.postEntity as! ElectronicEntity)
            contactAddressEntity = entity.ContactAddress!
            postedBy = entity.PostedBy!
            officialEmail = entity.UserOfficialEmail!
            userImageUrl = entity.UserImageUrl!
            break
        case .RealEstate:
            let entity = (self.postEntity as! RealEstateEntity)
            contactAddressEntity = entity.ContactAddress!
            postedBy = entity.PostedBy!
            officialEmail = entity.UserOfficialEmail!
            userImageUrl = entity.UserImageUrl!
            break
        case .Furniture:
            let entity = (self.postEntity as! FurnitureEntity)
            contactAddressEntity = entity.ContactAddress!
            postedBy = entity.PostedBy!
            officialEmail = entity.UserOfficialEmail!
            userImageUrl = entity.UserImageUrl!
            break
        case .Others:
            let entity = (self.postEntity as! OtherEntity)
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
        ContactName.text = contactAddressEntity.ContactName
        ContactAddress.text = contactAddressEntity.Adress
    }
}