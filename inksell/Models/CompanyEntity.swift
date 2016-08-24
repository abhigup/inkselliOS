//
//  CompanyEntity.swift
//  inksell
//
//  Created by Abhinav Gupta on 10/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class CompanyEntity : Mappable{
    
    var CompanyId:Int?
    var CompanyName:String?
    var CompanyDomain:String?
    
    init() {}
    required convenience public init?(_ map: Map) { self.init() }
    
    
    public func mapping(map: Map) {
        CompanyId <- map["companyId"]
        CompanyName <- map["companyName"]
        CompanyDomain <- map["companyDomain"]
    }
    
}
