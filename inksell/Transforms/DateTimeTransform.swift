//
//  DateTimeTransform.swift
//  inksell
//
//  Created by Abhinav Gupta on 12/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class DateTimeTransform: TransformType {
    public typealias Object = NSDate
    public typealias JSON = String    
    public init() {}
    
    public func transformFromJSON(value: AnyObject?) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let date = dateFormatter.dateFromString((value as? String)!)
        return date
    }
    
    public func transformToJSON(value: NSDate?) -> String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.stringFromDate(value!)
        return dateString
    }
}