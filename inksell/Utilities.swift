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
    
    static func setUserImage(userName : String?, userImageUri: String?, imageView: UIImageView)
    {
        if(!userImageUri.isNilOrEmpty)
        {
            let placeholderImage = UIImage(named: "user")!
            imageView.af_setImageWithURL(NSURL(string: userImageUri!)!, placeholderImage: placeholderImage, filter: CircleFilter())
        }
    }
    
}
