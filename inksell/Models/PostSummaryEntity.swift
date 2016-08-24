//
//  PostSummaryEntity.swift
//  inksell
//
//  Created by Abhinav Gupta on 19/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class PostSummaryEntity : Mappable {
    var CompanyId:Int?
    var IsSoldOut:Bool?
    var IsVisibleToAll:Bool?
    var LocationId:Int?
    var postId:Int?
    var Postdate:NSDate?
    var PostedBy:String?
    var Title:String?
    var UserImageUrl:String?
    var categoryid:Int?
    var PostDefaultImage:String?
    var isFavourite:Bool?
    
    var HasPostTitlePic:Bool{ get{
        return !self.PostDefaultImage.isNilOrEmpty
        }
    }
    
    var isEditable:Bool?
    
    init() {}
    required convenience public init?(_ map: Map) { self.init() }
    
    
    public func mapping(map: Map) {
        CompanyId <- map["CompanyId"]
        IsSoldOut <- map["IsSoldOut"]
        IsVisibleToAll <- map["IsVisibleToAll"]
        LocationId <- map["LocationId"]
        postId <- map["postId"]
        Postdate <- (map["Postdate"], DateTimeTransform())
        PostedBy <- map["PostedBy"]
        Title <- map["Title"]
        UserImageUrl <- map["UserImageUrl"]
        categoryid <- map["categoryid"]
        PostDefaultImage <- map["PostDefaultImage"]
        isFavourite <- map["isFavourite"]
        isEditable <- map["isEditable"]
    }
}
