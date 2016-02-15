//
//  RegisterViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 25/10/15.
//  Copyright © 2015 inksell. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import SCLAlertView
import Toast_Swift

class RegisterViewController: BaseViewController {

    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Company: UITextField!
    @IBOutlet weak var Location: UITextField!
    @IBOutlet weak var emailid: UITextField!
    @IBOutlet weak var NewRegister: UIButton!
    @IBOutlet weak var RegisterBtn: UIButton!
    @IBOutlet weak var CompanyDomain: UILabel!
    
    var companies: [CompanyEntity]?
    var locations: [LocationEntity]?
    
    var selectedCompanyIndex: Int=0
    var selectedLocationIndex:Int=0
    
    override func initController() {
        RestClient.get.getCompanies(InksellCallback<[CompanyEntity]>(success: {
            companies in
            self.companies = companies
            }, failure: { (ResponseStatus) -> Void in
                
        }))
    }
    

    func LoadLocations(CompanyId: Int)
    {
        RestClient.get.getLocations(CompanyId, callback: InksellCallback<[LocationEntity]>(success:
            { locations in
                self.locations = locations
            }, failure: { (ResponseStatus) -> Void in
                
        }))
    }
    
    
    @IBAction func Navigate(sender: UIButton) {
        switch(sender)
        {
        case NewRegister:
            NavigateTo("NavToNewRegister");
            break;
        case RegisterBtn:
            if(self.Name.text.isNilOrEmpty || self.Company.text.isNilOrEmpty || self.Location.text.isNilOrEmpty || self.emailid.text.isNilOrEmpty)
            {
                view.makeToast(message: "Please provide all the details")
                return
            }
            
            PersistentStorage.sharedInstance.saveData(StorageConstants.IsAlreadyRegistered, object: false)
            NavigateTo("NavToVerify", anyObject: false);
            break;
        default:
            break;
        }
    }
    
    @IBAction func ShowActionSheet(sender: UITextField) {
        switch(sender)
        {
        case Company:
            ActionSheetStringPicker.showPickerWithTitle("Select Company", rows: companies!.flatMap({$0.CompanyName})
                , initialSelection: selectedCompanyIndex, doneBlock: {picker, companyIndex, indexes in
                    self.selectedCompanyIndex = companyIndex
                    self.Company.text = self.companies![companyIndex].CompanyName!
                    self.LoadLocations(self.companies![companyIndex].CompanyId!)
                    self.Location.text = ""
                    self.CompanyDomain.text = self.companies![companyIndex].CompanyDomain
                    self.selectedLocationIndex = 0
                    return
                }, cancelBlock: { ActionMultipleStringCancelBlock in return }, origin: sender)
        break
        
        case Location:
            if(locations == nil)
            {
                SCLAlertView().showError("No Company Selected", subTitle: "Please select a company.")
                return
            }
            ActionSheetStringPicker.showPickerWithTitle("Select Location", rows: locations!.flatMap({$0.LocationName})
                , initialSelection: selectedLocationIndex, doneBlock: { picker, locationIndex, indexes in
                    self.selectedLocationIndex = locationIndex
                    self.Location.text = self.locations![locationIndex].LocationName!
                    return
                    }, cancelBlock: { ActionMultipleStringCancelBlock in return }, origin: sender)
        break
            
        default:
            break
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
