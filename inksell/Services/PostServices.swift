//
//  PostServices.swift
//  inksell
//
//  Created by Abhinav Gupta on 10/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class PostServices{
    
    func addOthersPost(body: OtherEntity, isMultiple:Int, completionHandler: InksellCallback<String>)
    {
        RestClient.postString("addOtherPost/\(isMultiple)", body: body, callback: completionHandler)
    }
    
    func addAutomobilePost(body: AutomobileEntity, isMultiple:Int, completionHandler: InksellCallback<String>)
    {
        RestClient.postString("addAutomobilePost/\(isMultiple)", body: body, callback: completionHandler)
    }
    
    func addFurniturePost(body: FurnitureEntity, isMultiple:Int, completionHandler: InksellCallback<String>)
    {
        RestClient.postString("addFurniturePost/\(isMultiple)", body: body, callback: completionHandler)
    }
    
    func addElectronicsPost(body: ElectronicEntity, isMultiple:Int, completionHandler: InksellCallback<String>)
    {
        RestClient.postString("addElectronicsPost/\(isMultiple)", body: body, callback: completionHandler)
    }
    
    func createUpdateUserData(completionHandler: InksellCallback<String>)
    {
        RestClient.postString("createUsers", body: AppData.userData!, callback: completionHandler)
    }
}
