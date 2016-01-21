//
//  ConfigurationManager.swift
//  inksell
//
//  Created by Abhinav Gupta on 21/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation

class ConfigurationManager {
    
    static let sharedInstance = ConfigurationManager()
    
    var userGuid:String
    var userData:UserEntity?
    
    init()
    {
        _ = userData
        userGuid = "hello"
    }
}