//
//  ContactView.swift
//  inksell
//
//  Created by Abhinav Gupta on 18/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import Material

class ContactsView: BaseTableViewCell, IAddViewProtocol {
    
    @IBOutlet weak var UserImageView: UIImageView!
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var ContactPerson: CustomMaterialTextField!
    @IBOutlet weak var ContactNumber: CustomMaterialTextField!
    @IBOutlet weak var ContactEmail: CustomMaterialTextField!
    @IBOutlet weak var ContactAddress: CustomMaterialTextField!
    @IBOutlet weak var ContactCity: CustomMaterialTextField!
    @IBOutlet weak var UseMyInfoSwitch: UISwitch!
    @IBOutlet weak var UserImageLabel: UILabel!
    
    @IBAction func useMyContactInfo(sender: AnyObject) {
    }
    
    override func initCell() {
        setUserData()
    }
    
    func setUserData()
    {
        Utilities.setUserImage(AppData.userData!.Username, userImageUri: AppData.userData!.UserImageUrl, imageView: UserImageView, imageLabel: UserImageLabel)
        UsernameLabel.text = AppData.userData!.Username
    }
    
    func verifyAndGetData(postEntity: IPostEntity, postCategory: CategoryType) -> Bool {
        if(ContactPerson.text.isNilOrEmpty)
        {
            AlertController.alert("Incomplete Contact Information", message: "Contact Person name is required")
            return false
        }
        if(ContactEmail.text.isNilOrEmpty && ContactNumber.text.isNilOrEmpty)
        {
            AlertController.alert("Incomplete Contact Information", message: "Either Contact Number or Email is required.")
            return false
        }
        
        let contactEntity = ContactAdressEntity()
        contactEntity.Adress = ContactAddress.text
        contactEntity.City = ContactCity.text
        contactEntity.ContactEmail = ContactEmail.text
        contactEntity.ContactName = ContactPerson.text
        contactEntity.ContactNumber = ContactNumber.text
        
        switch postCategory {
        case .Automobile:
            let entity = postEntity as? AutomobileEntity
            entity?.ContactAddress = contactEntity
            break
        case .Furniture:
            let entity = postEntity as? FurnitureEntity
            entity?.ContactAddress = contactEntity
            break
        case .Electronics:
            let entity = postEntity as? ElectronicEntity
            entity?.ContactAddress = contactEntity
            break
        case .Others:
            let entity = postEntity as? OtherEntity
            entity?.ContactAddress = contactEntity
            break
        case .RealEstate:
            let entity = postEntity as? RealEstateEntity
            entity?.ContactAddress = contactEntity
            break
        default:
            AlertController.alert("Not Supported Catefory")
            return false
        }
        
        return true
    }
}