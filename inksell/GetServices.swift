//
//  GetServices.swift
//  inksell
//
//  Created by Abhinav Gupta on 10/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

public class GetServices
{
    func getCompanies(completionHandler: ([CompanyEntity]?) -> ())
    {
        RestClient.getArray("getCompanies", completionHandler: completionHandler)
    }
    
    func getLocations(companyId: Int, completionHandler: ([LocationEntity]?) -> ())
    {
        RestClient.getArray("getLocations/\(companyId)", completionHandler: completionHandler)
    }
}