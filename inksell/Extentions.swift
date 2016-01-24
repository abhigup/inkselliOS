//
//  Extentions.swift
//  inksell
//
//  Created by Abhinav Gupta on 24/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation


protocol OptionalString {}
extension String: OptionalString {}

extension Optional where Wrapped: OptionalString {
    var isNilOrEmpty: Bool {
        return ((self as? String) ?? "").isEmpty
    }
}

extension String{
    var isNilOrEmpty: Bool {
        return (self ?? "").isEmpty
    }
}
