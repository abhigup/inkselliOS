//
//  MultiplePostDetailsEntity.swift
//  inksell
//
//  Created by Abhinav Gupta on 19/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class MultiplePostDetailsEntity : Mappable{
    
    var userGuid:String?
    var postTitle:String?
    var associatedPostList:String?
    var IsVisibleToAll:Bool?
    
    init() {}
    required convenience public init?(_ map: Map) { self.init() }
    
    
    public func mapping(map: Map) {
        userGuid <- map["userGuid"]
        postTitle <- map["postTitle"]
        associatedPostList <- map["associatedPostList"]
        IsVisibleToAll <- map["IsVisibleToAll"]
    }
}
