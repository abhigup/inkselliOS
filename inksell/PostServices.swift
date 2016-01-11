//
//  PostServices.swift
//  inksell
//
//  Created by Abhinav Gupta on 10/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper

public class PostServices{
    
    func getCompanies(body: CompanyEntity?, completionHandler: (CompanyEntity) -> ())
    {
        RestClient.postObject("hello", body: body, completionHandler: completionHandler)
    }
}
