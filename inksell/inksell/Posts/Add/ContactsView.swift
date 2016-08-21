//
//  ContactView.swift
//  inksell
//
//  Created by Abhinav Gupta on 18/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import Material

class ContactsView: BaseTableViewCell {
    
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
}