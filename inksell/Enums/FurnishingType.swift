//
//  FurnishingType.swift
//  inksell
//
//  Created by Abhinav Gupta on 11/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation

enum  FurnishingType :Int {
    case UnFurnished,
    SemiFurnished,
    FullyFurnished
}

extension FurnishingType{
    static func getFurnishingString(type : Int) -> String {
        let furnishingType = FurnishingType(rawValue: type)
        switch furnishingType! {
        case .FullyFurnished:
            return "Fully-Furnished"
        case .SemiFurnished:
            return "Semi-Furnished"
        case .UnFurnished:
            return "Unfurnished"
        }
    }
}
