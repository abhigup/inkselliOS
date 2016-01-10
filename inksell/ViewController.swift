//
//  ViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 24/10/15.
//  Copyright © 2015 inksell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RestClient.get.getCompanies { (companies : [CompanyEntity]?) -> () in
            var company = companies
        }
        
        RestClient.get.getLocations(1, completionHandler: {(locations : [LocationEntity]?) -> () in
            var company = locations
        })
        
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

