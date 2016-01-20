//
//  UserEntity.swift
//  inksell
//
//  Created by Abhinav Gupta on 19/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

class UserEntity : Mappable {
    var UserGuid:String?
    var Username:String?
    var PersonalEmail:String?
    var CorporateEmail:String?
    var CompanyId:Int?
    var LocationId:Int?
    var Address:String?
    var City:String?
    var PhoneNumber:String?
    var UserImageUrl:String?
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        UserGuid <- map["UserGuid"]
        Username <- map["Username"]
        PersonalEmail <- map["PersonalEmail"]
        CorporateEmail <- map["CorporateEmail"]
        CompanyId <- map["CopmanyId"]
        LocationId <- map["LocationId"]
        Address <- map["Address"]
        City <- map["City"]
        PhoneNumber <- map["PhoneNumber"]
        UserImageUrl <- map["UserImageUrl"]
    }
}