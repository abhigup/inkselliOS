//
//  RealEstateViewCell.swift
//  inksell
//
//  Created by Abhinav Gupta on 10/09/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class RealEstateViewCell: BaseViewPostCell {
    
    var realEstateEntity : RealEstateEntity?

    @IBOutlet weak var PropertyAddress: UILabel!
    @IBOutlet weak var Rent: UILabel!
    @IBOutlet weak var Maintenance: UILabel!
    @IBOutlet weak var BHK: UILabel!
    @IBOutlet weak var AvailableFrom: UILabel!
    @IBOutlet weak var Area: UILabel!
    @IBOutlet weak var Furnishing: UILabel!
    
    @IBOutlet weak var WaterImage: UIImageView!
    @IBOutlet weak var PowerImage: UIImageView!
    @IBOutlet weak var ParkingImage: UIImageView!
    @IBOutlet weak var WifiImage: UIImageView!
    
    @IBOutlet weak var Description: UILabel!
    
    override func initCell() {
        realEstateEntity = (self.postEntity as! RealEstateEntity)
        PropertyAddress.text = realEstateEntity?.PropertyAddress
        Rent.text = realEstateEntity?.RentPrice
        Maintenance.text = realEstateEntity?.MaintenancePrice
        BHK.text = realEstateEntity?.Bhk
        AvailableFrom.text = realEstateEntity?.AvailableFrom
        Area.text = realEstateEntity?.Area
        Furnishing.text = FurnishingType.getFurnishingString((realEstateEntity?.FurnishedType)!)
        Description.text = realEstateEntity?.PostDescription
        
        initFeatures()
    }
    
    func initFeatures(){
        WaterImage.setRounded()
        PowerImage.setRounded()
        ParkingImage.setRounded()
        WifiImage.setRounded()
        
        if(realEstateEntity?.Is24x7Water == true)
        {
            WaterImage.backgroundColor = UIColor().pink_pressed()
        }
        if(realEstateEntity?.IsPowerBackup == true)
        {
            PowerImage.backgroundColor = UIColor().pink_pressed()
        }
        if(realEstateEntity?.isInternet == true)
        {
            WifiImage.backgroundColor = UIColor().pink_pressed()
        }
        if(realEstateEntity?.IsParking == true)
        {
            ParkingImage.backgroundColor = UIColor().pink_pressed()
        }
    }
}
