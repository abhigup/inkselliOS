//
//  CategoryType.swift
//  inksell
//
//  Created by Abhinav Gupta on 10/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

enum CategoryType:Int{
    case AllCategory
    case Electronics
    case Automobile
    case Furniture
    case RealEstate
    case Others
    case Multiple
}

extension CategoryType
{
    func getString() -> String {
        switch self {
        case .AllCategory:
            return "All Categories"
        case .Automobile:
            return "Automobiles"
        case .Electronics:
            return "Electronics"
        case .Furniture:
            return "Furniture"
        case .Others:
            return "Others"
        case .RealEstate:
            return "Real Estate"
        case .Multiple:
            return "Multiple Items"
        }
    }
    
    func getIcon() -> UIImage {
        switch self {
        case .Automobile:
            return UIImage(named: "auto")!
        case .Electronics:
            return UIImage(named: "electronics")!
        case .Furniture:
            return UIImage(named: "furniture")!
        case .Others:
            return UIImage(named: "other")!
        case .RealEstate:
            return UIImage(named: "realestate")!
        case .Multiple:
            return UIImage(named: "multiple")!
        default:
            return UIImage()
        }
    }
}
