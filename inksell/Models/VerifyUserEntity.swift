//
//  VerifyUserEntity.swift
//  inksell
//
//  Created by Abhinav Gupta on 19/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class VerifyUserEntity : Mappable {
    var Username:String?
    var CompanyId:Int?
    var CorporateEmail:String?
    var LocationId:Int?
    var userGuid:String?
    
    init() {}
    required convenience public init?(_ map: Map) { self.init() }
    
    
    public func mapping(map: Map) {
        Username <- map["Username"]
        CompanyId <- map["CopmanyId"]
        CorporateEmail <- map["CorporateEmail"]
        LocationId <- map["LocationId"]
        userGuid <- map["userGuid"]
    }

}
