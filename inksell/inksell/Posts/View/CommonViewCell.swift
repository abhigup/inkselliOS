//
//  CommonViewCell.swift
//  inksell
//
//  Created by Abhinav Gupta on 28/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class CommonViewCell : BaseViewPostCell {
    @IBOutlet weak var ExpectedPrice: UILabel!
    @IBOutlet weak var ActualPrice: UILabel!
    @IBOutlet weak var UsedPeriod: UILabel!
    @IBOutlet weak var MakeBrand: UILabel!
    @IBOutlet weak var Description: UILabel!
    
    override func initCell() {
        switch categoryType! {
        case .Electronics:
            let entity = postEntity as! ElectronicEntity
            ExpectedPrice.text = entity.ExpectedPrice
            ActualPrice.text = entity.ActualPrice
            UsedPeriod.text = entity.UsedPeriod
            MakeBrand.text = entity.MakeBrand
            Description.text = entity.PostDescription
        case .Automobile:
            let entity = postEntity as! AutomobileEntity
            ExpectedPrice.text = entity.ExpectedPrice
            ActualPrice.text = entity.ActualPrice
            UsedPeriod.text = entity.UsedPeriod
            MakeBrand.text = entity.MakeBrand
            Description.text = entity.PostDescription
        case .Furniture:
            let entity = postEntity as! FurnitureEntity
            ExpectedPrice.text = entity.ExpectedPrice
            ActualPrice.text = entity.ActualPrice
            UsedPeriod.text = entity.UsedPeriod
            MakeBrand.text = entity.MakeBrand
            Description.text = entity.PostDescription
        case .Others:
            let entity = postEntity as! OtherEntity
            ExpectedPrice.text = entity.ExpectedPrice
            ActualPrice.text = entity.ActualPrice
            UsedPeriod.text = entity.UsedPeriod
            MakeBrand.text = entity.MakeBrand
            Description.text = entity.PostDescription

        default:
            return
        }
    }
}