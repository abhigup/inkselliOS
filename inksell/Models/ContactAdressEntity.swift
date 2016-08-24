//
//  ContactAdressEntity.swift
//  inksell
//
//  Created by Abhinav Gupta on 11/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class ContactAdressEntity :Mappable{
    var Adress:String?
    var AdressId:Int?
    var City:String?
    var ContactEmail:String?
    var ContactNumber:String?
    var ContactName:String?
    
    init() {}
    required convenience public init?(_ map: Map) { self.init() }

    
    public func mapping(map: Map) {
        Adress <- map["Adress"]
        AdressId <- map["AdressId"]
        City <- map["City"]
        ContactEmail <- map["ContactEmail"]
        ContactNumber <- map["ContactNumber"]
        ContactName <- map["contactName"]    }
}