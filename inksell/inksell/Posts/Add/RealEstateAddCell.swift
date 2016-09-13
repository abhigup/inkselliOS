//
//  RealEstateAddCell.swift
//  inksell
//
//  Created by Abhinav Gupta on 11/09/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import Material

class RealEstateAddCell: BaseTableViewCell, IAddViewProtocol, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var Title: CustomMaterialTextField!
    @IBOutlet weak var Rent: CustomMaterialTextField!
    @IBOutlet weak var Maintenance: CustomMaterialTextField!
    @IBOutlet weak var BHK: CustomMaterialTextField!
    @IBOutlet weak var Area: CustomMaterialTextField!
    @IBOutlet weak var AvailableFrom: CustomMaterialTextField!
    @IBOutlet weak var Furnishing: CustomMaterialTextField!
    @IBOutlet weak var Description: UITextView!

    var FurnishingPickerView : UIPickerView?
    
    @IBOutlet weak var WaterButton: UIButton!
    @IBOutlet weak var PowerButton: UIButton!
    @IBOutlet weak var InternetButton: UIButton!
    @IBOutlet weak var ParkingButton: UIButton!
    
    var hasWater : Bool = false
    var hasPower : Bool = false
    var hasInternet : Bool = false
    var hasParking : Bool = false
    
    override func initCell() {
        WaterButton.setRounded()
        PowerButton.setRounded()
        InternetButton.setRounded()
        ParkingButton.setRounded()
    }
    
    
    @IBAction func featureClick(sender: UIButton!) {
        if(sender == WaterButton)
        {
            hasWater = !hasWater
            toggleFeatureButton(hasWater, button: sender)
        }
        if(sender == PowerButton)
        {
            hasPower = !hasPower
            toggleFeatureButton(hasPower, button: sender)
        }
        if(sender == InternetButton)
        {
            hasInternet = !hasInternet
            toggleFeatureButton(hasInternet, button: sender)
        }
        if(sender == ParkingButton)
        {
            hasParking = !hasParking
            toggleFeatureButton(hasParking, button: sender)
        }
    }
    
    private func toggleFeatureButton(newValue:Bool, button: UIButton!)
    {
        if(newValue == true)
        {
            button.backgroundColor = UIColor().pink_pressed()
        }
        else
        {
            button.backgroundColor = UIColor.groupTableViewBackgroundColor()
        }
    }
    
    func numberOfComponentsInPickerView(colorPicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return FurnishingType.getFurnishingString(row)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.Furnishing.text = FurnishingType.getFurnishingString(row)
            }
    
    @IBAction func furnishingEditing(sender: UITextField) {
        if(self.FurnishingPickerView == nil)
        {
            self.FurnishingPickerView = UIPickerView()
            self.FurnishingPickerView!.delegate = self
            self.FurnishingPickerView!.dataSource = self
            self.FurnishingPickerView!.backgroundColor = UIColor.whiteColor()
            sender.inputView = FurnishingPickerView
        }
        self.FurnishingPickerView?.hidden = false
    }
    
    @IBAction func availableFromEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        datePickerView.backgroundColor = UIColor.whiteColor()
        sender.inputView = datePickerView        
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        AvailableFrom.text = dateFormatter.stringFromDate(sender.date)
    }
    
    func verifyAndGetData(postEntity: IPostEntity, postCategory: CategoryType) -> Bool {
        return true
    }
    
}