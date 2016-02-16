//
//  Utilities.swift
//  inksell
//
//  Created by Abhinav Gupta on 21/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import AlamofireImage
import Foundation

class Utilities {
    
    static func setUserImage(userName : String?, userImageUri: String?, imageView: UIImageView, imageLabel : UILabel)
    {
        imageView.backgroundColor = UIColor().Transparent()
        imageView.image = nil
        imageLabel.text = ""
        
        if(!userImageUri.isNilOrEmpty)
        {
            let placeholderImage = UIImage(named: "user")!
            imageView.af_setImageWithURL(NSURL(string: userImageUri!)!, placeholderImage: placeholderImage, filter: CircleFilter())
        }
        else
        {
            imageView.layer.cornerRadius = imageView.frame.size.width/2
            imageView.clipsToBounds = true
            imageView.backgroundColor = UIColor.randomColor()
            imageLabel.text = userName![0]
        }
    }
    
    static func getRelativeStringDate(date:NSDate) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components([NSCalendarUnit.Minute , NSCalendarUnit.Hour , NSCalendarUnit.Day , NSCalendarUnit.WeekOfYear , NSCalendarUnit.Month , NSCalendarUnit.Year , NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())
        
        if (components.year >= 2) {
            return "\(components.year) years ago"
        } else if (components.year >= 1){
                return "Last year"
            
        } else if (components.month >= 2) {
            return "\(components.month) months ago"
        } else if (components.month >= 1){
            return "Last month"
        } else if (components.weekOfYear >= 2) {
            return "\(components.weekOfYear) weeks ago"
        } else if (components.weekOfYear >= 1){
            return "Last week"
        } else if (components.day >= 2) {
            return "\(components.day) days ago"
        } else if (components.day >= 1){
            return "Yesterday"
        } else if (components.hour >= 2) {
            return "\(components.hour) hours ago"
        } else if (components.hour >= 1){
            return "An hour ago"
        } else if (components.minute >= 1) {
            return "\(components.minute) minutes ago"
        } else{
            return "Just now"
        }
    }
}
