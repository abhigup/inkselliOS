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
    func alreadyRegistered(emailId: String, callback:InksellCallback<String>)
    {
        RestClient.getString("registerUserAgain/\(emailId)", callback: callback)
    }
    
    func verifyUser(guid: String, code:String, isAlreadyRegistered:Bool, callback:InksellCallback<Int>)
    {
        RestClient.getString("verifyUser/\(guid)/\(code)/\(isAlreadyRegistered ? 1 : 0)", callback: callback)
    }
    
    func getCompanies(callback:InksellCallback<[CompanyEntity]>)
    {
        RestClient.getArray("getCompanies", callback: callback)
    }
    
    func getAutomobile(guid: String, postId: Int, callback:InksellCallback<AutomobileEntity>)
    {
        RestClient.getObject("GetFullElectronicPost/\(postId)/\(guid)", callback: callback)
    }
    
    func getLocations(companyId: Int, callback:InksellCallback<[LocationEntity]>)
    {
        RestClient.getArray("getLocations/\(companyId)", callback: callback)
    }
    
    func getUserDetails(guid: String, callback:InksellCallback<UserEntity>)
    {
        RestClient.getObject("GetUserEntityDevFriendly/\(guid)", callback: callback)
    }
    
    func getPostSummary(guid: String, lastPostId:Int, callback:InksellCallback<[PostSummaryEntity]>)
    {
        RestClient.getArray("GetPostSummaryAll/\(lastPostId)/\(guid)", callback: callback)
    }
}