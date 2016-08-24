//
//  AutomobileEntity.swift
//  inksell
//
//  Created by Abhinav Gupta on 11/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class AutomobileEntity: Mappable, IPostEntity{
    var LastModifiedDate:NSDate?
    var PostId:Int?
    var PostDescription:String?
    var PostTitle:String?
    var PostedBy:String?
    var UserGuid:String?
    var UserImageUrl:String?
    var UserOfficialEmail:String?
    var ActualPrice:String?
    var ExpectedPrice:String?
    var IsSoldOut:Bool?
    var IsVisibleToAll:Bool?
    var MakeBrand:String?
    var PostImagesUrl:[String]?
    var UserPeriod:String?
    var ContactAddress:ContactAdressEntity?
    
    init() {}
    required convenience public init?(_ map: Map) { self.init() }
    
    
    public func mapping(map: Map) {
        LastModifiedDate <- (map["LastModifiedDate"], DateTimeTransform())
        PostId <- map["PostId"]
        PostDescription <- map["companyDomain"]
        PostTitle <- map["PostTitle"]
        PostedBy <- map["PostedBy"]
        UserGuid <- map["UserGuid"]
        UserImageUrl <- map["UserImageUrl"]
        UserOfficialEmail <- map["UserOfficialEmail"]
        ActualPrice <- map["ActualPrice"]
        ExpectedPrice <- map["ExpectedPrice"]
        IsSoldOut <- map["IsSoldOut"]
        IsVisibleToAll <- map["IsVisibleToAll"]
        MakeBrand <- map["MakeBrand"]
        PostImagesUrl <- map["PostImagesUrl"]
        UserPeriod <- map["UserPeriod"]
        ContactAddress <- map["ContactAddress"]
    }
}