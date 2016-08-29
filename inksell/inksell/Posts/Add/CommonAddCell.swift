//
//  CommonView.swift
//  inksell
//
//  Created by Abhinav Gupta on 20/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import Material

class CommonAddCell: BaseTableViewCell, IAddViewProtocol {
    
    @IBOutlet weak var Title: CustomMaterialTextField!
    @IBOutlet weak var UsedPeriod: CustomMaterialTextField!
    @IBOutlet weak var ExpectedPrice: CustomMaterialTextField!
    @IBOutlet weak var ActualPrice: CustomMaterialTextField!
    @IBOutlet weak var Description: PlaceholderTextView!
    @IBOutlet weak var MakeBrand: CustomMaterialTextField!
    
    func verifyAndGetData(postEntity: IPostEntity, postCategory: CategoryType) -> Bool {
        if(Title.text.isNilOrEmpty)
        {
            AlertController.alert("Title is required")
            return false
        }
        
        switch postCategory {
        case .Automobile:
            let entity = postEntity as! AutomobileEntity
            entity.UserGuid = AppData.userGuid
            entity.PostTitle = Title.text
            entity.UsedPeriod = UsedPeriod.text
            entity.ActualPrice = ActualPrice.text
            entity.ExpectedPrice = ExpectedPrice.text
            entity.PostDescription = Description.text
            entity.MakeBrand = MakeBrand.text
            break
        case .Electronics:
            let entity = postEntity as! ElectronicEntity
            entity.UserGuid = AppData.userGuid
            entity.PostTitle = Title.text
            entity.UsedPeriod = UsedPeriod.text
            entity.ActualPrice = ActualPrice.text
            entity.ExpectedPrice = ExpectedPrice.text
            entity.PostDescription = Description.text
            entity.MakeBrand = MakeBrand.text
            break
        case .Others:
            let entity = postEntity as! OtherEntity
            entity.UserGuid = AppData.userGuid
            entity.PostTitle = Title.text
            entity.UsedPeriod = UsedPeriod.text
            entity.ActualPrice = ActualPrice.text
            entity.ExpectedPrice = ExpectedPrice.text
            entity.PostDescription = Description.text
            entity.MakeBrand = MakeBrand.text
            break
        case .Furniture:
            let entity = postEntity as! FurnitureEntity
            entity.UserGuid = AppData.userGuid
            entity.PostTitle = Title.text
            entity.UsedPeriod = UsedPeriod.text
            entity.ActualPrice = ActualPrice.text
            entity.ExpectedPrice = ExpectedPrice.text
            entity.PostDescription = Description.text
            entity.MakeBrand = MakeBrand.text
            break
        default:
            AlertController.alert("Not Supported Category")

        }
        return true
    }
}