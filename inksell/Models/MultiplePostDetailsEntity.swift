//
//  MultiplePostDetailsEntity.swift
//  inksell
//
//  Created by Abhinav Gupta on 19/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

class MultiplePostDetailsEntity : Mappable{
    
    var userGuid:String?
    var postTitle:String?
    var associatedPostList:String?
    var IsVisibleToAll:Bool?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        userGuid <- map["userGuid"]
        postTitle <- map["postTitle"]
        associatedPostList <- map["associatedPostList"]
        IsVisibleToAll <- map["IsVisibleToAll"]
    }
}
