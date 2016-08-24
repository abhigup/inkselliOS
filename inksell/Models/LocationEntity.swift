//
//  LocationEntity.swift
//  inksell
//
//  Created by Abhinav Gupta on 10/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class LocationEntity: Mappable
{
    var LocationId: Int?
    var LocationName: String?
    var CountryName: String?
    
    init() {}
    required convenience public init?(_ map: Map) { self.init() }
    
    
    public func mapping(map: Map) {        LocationId <- map["locationId"]
        LocationName <- map["locationName"]
        CountryName <- map["countryName"]
    }
    
}
