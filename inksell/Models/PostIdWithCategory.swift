//
//  PostIdWithCategory.swift
//  inksell
//
//  Created by Abhinav Gupta on 19/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class PostIdWithCategory : Mappable {
    var categoryId:Int?
    var postId:Int?
    var postTitle:String?
    
    init() {}
    required convenience public init?(_ map: Map) { self.init() }
    
    
    public func mapping(map: Map) {
        categoryId <- map["categoryId"]
        postId <- map["postId"]
        postTitle <- map["postTitle"]
    }
}