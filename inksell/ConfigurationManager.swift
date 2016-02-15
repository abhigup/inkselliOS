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
    
    func InitUserData()
    {
        AppData.userData = PersistentStorage.sharedInstance.getData(StorageConstants.UserData)
        AppData.userGuid = PersistentStorage.sharedInstance.getData(StorageConstants.UserUUID)
    }
}