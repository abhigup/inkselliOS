//
//  RealEstateEntity.swift
//  inksell
//
//  Created by Abhinav Gupta on 19/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class RealEstateEntity: Mappable, IPostEntity{
    var LastModifiedDate:NSDate?
    var PostId:Int?
    var UserGuid:String?
    var UserOfficialEmail:String?
    var PostDescription:String?
    var PostedBy:String?
    var ContactAddress:ContactAdressEntity?
    var PropertyAddress:String?
    var PostTitle:String?
    var IsRent:Bool?
    var Is24x7Water:Bool?
    var IsParking:Bool?
    var IsPowerBackup:Bool?
    var Bhk:String?
    var isInternet:Bool?
    var AvailableFrom:String?
    var Area:String?
    var PricePerSqFt:String?
    var RentPrice:String?
    var MaintenancePrice:String?
    var PostImagesUrl:[String]?
    var latitude:Double?
    var longitude:Double?
    var FurnishedType:Int?
    var UserImageUrl:String?
    var IsSoldOut:Bool?
    var IsVisibleToAll:Bool?
    
    init() {}
    required convenience public init?(_ map: Map) { self.init() }
    
    
    public func mapping(map: Map) {
        LastModifiedDate <- (map["LastModifiedDate"], DateTimeTransform())
        PostId <- map["PostId"]
        UserGuid <- map["UserGuid"]
        UserOfficialEmail <- map["UserOfficialEmail"]
        PostDescription <- map["PostDescription"]
        PostTitle <- map["PostTitle"]
        PostedBy <- map["PostedBy"]
        ContactAddress <- map["ContactAddress"]
        PropertyAddress <- map["PropertyAddress"]
        IsRent <- map["IsRent"]
        Is24x7Water <- map["Is24x7Water"]
        IsParking <- map["IsParking"]
        IsPowerBackup <- map["IsPowerBackup"]
        Bhk <- map["Bhk"]
        isInternet <- map["isInternet"]
        AvailableFrom <- map["AvailableFrom"]
        Area <- map["Area"]
        PricePerSqFt <- map["PricePerSqFt"]
        RentPrice <- map["RentPrice"]
        MaintenancePrice <- map["MaintenancePrice"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        FurnishedType <- map["FurnishedType"]
        UserImageUrl <- map["UserImageUrl"]
        IsSoldOut <- map["IsSoldOut"]
        IsVisibleToAll <- map["IsVisibleToAll"]
        PostImagesUrl <- map["PostImagesUrl"]
        
    }
}
