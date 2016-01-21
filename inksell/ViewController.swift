//
//  ViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 24/10/15.
//  Copyright © 2015 inksell. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var RegisterBtn: UIButton!
    @IBOutlet weak var VerifyBtn: UIButton!
    @IBOutlet weak var AlreadyBtn: UIButton!
    
    @IBAction func Navigate(sender: UIButton) {
        switch(sender)
        {
        case RegisterBtn:
            self.NavigateTo("NavToRegister")
            break
        case VerifyBtn:
            self.NavigateTo("NavToVerify")
            break
        case AlreadyBtn:
            self.NavigateTo("NavToAlready")
            break
        default: break
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var auto = RestClient.get.getAutomobile("937572ea-a459-41a9-ab64-7d4bb3cfb5cf", postId: 71249) { (automobileEntity : AutomobileEntity) -> () in
            var aut = automobileEntity
        }
//        var enumValue = FurnishingType.FullyFurnished.rawValue
//        //PersistentStorage.sharedInstance.clearAll()
//        var comp: [CompanyEntity]? = PersistentStorage.sharedInstance.getData("companies")
//        
//        PersistentStorage.sharedInstance.saveData("str", object: "hello")
//        var str:String? = PersistentStorage.sharedInstance.getData("str")
//        
//        
//        RestClient.get.getCompanies { (companies : [CompanyEntity]) -> () in
//            var company = companies
//            PersistentStorage.sharedInstance.saveData("companies", object: company)
//        }
//        
//        RestClient.get.getLocations(1, completionHandler: {(locations : [LocationEntity]?) -> () in
//            var company = locations
//        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}

