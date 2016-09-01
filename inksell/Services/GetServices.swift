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
    
    func verifyUser(code:String, isAlreadyRegistered:Bool, callback:InksellCallback<Int>)
    {
        RestClient.getString("verifyUser/\(AppData.userGuid!)/\(code)/\(isAlreadyRegistered ? 1 : 0)", callback: callback)
    }
    
    func getCompanies(callback:InksellCallback<[CompanyEntity]>)
    {
        RestClient.getArray("getCompanies", callback: callback)
    }
    
    private func getEntityCallback<T : IPostEntity>(callback : InksellCallback<IPostEntity>) -> InksellCallback<T>{
        let entityCallback = InksellCallback<T>(success: {
            entity in
            callback.onSuccess(entity)
            }
            , failure: { (ResponseStatus) -> () in
                callback.onFailure(ResponseStatus)
        });
        return entityCallback
    }

    func getFullPostEntity(postId:Int, categoryType: CategoryType, callback:InksellCallback<IPostEntity>)
    {
        switch categoryType {
            case .Automobile:
                getAutomobile(postId, callback: getEntityCallback(callback));
            case .Electronics:
                getElectronics(postId, callback: getEntityCallback(callback));
            case .Furniture:
                getFurniture(postId, callback: getEntityCallback(callback));
            case .RealEstate:
                getRealEstate(postId, callback: getEntityCallback(callback));
            case .Others:
                getOthers(postId, callback: getEntityCallback(callback));
            default:
                return
        }
    }
    
    private func getAutomobile(postId: Int, callback:InksellCallback<AutomobileEntity>)
    {
        RestClient.getObject("GetFullAutomobilePost/\(postId)/\(AppData.userGuid!)", callback: callback)
    }
    
    private func getElectronics(postId: Int, callback:InksellCallback<ElectronicEntity>)
    {
        RestClient.getObject("GetFullElectronicPost/\(postId)/\(AppData.userGuid!)", callback: callback)
    }
    
    private func getOthers(postId: Int, callback:InksellCallback<OtherEntity>)
    {
        RestClient.getObject("GetFullOtherPost/\(postId)/\(AppData.userGuid!)", callback: callback)
    }
    
    private func getFurniture(postId: Int, callback:InksellCallback<FurnitureEntity>)
    {
        RestClient.getObject("GetFullFurniturePost/\(postId)/\(AppData.userGuid!)", callback: callback)
    }
    
    private func getRealEstate(postId: Int, callback:InksellCallback<RealEstateEntity>)
    {
        RestClient.getObject("GetFullRealStatePost/\(postId)/\(AppData.userGuid!)", callback: callback)
    }
    
    func getLocations(companyId: Int, callback:InksellCallback<[LocationEntity]>)
    {
        RestClient.getArray("getLocations/\(companyId)", callback: callback)
    }
    
    func getUserDetails(callback:InksellCallback<UserEntity>)
    {
        RestClient.getObject("GetUserEntityDevFriendly/\(AppData.userGuid!)", callback: callback)
    }
    
    func getPostSummary(lastPostId:Int, callback:InksellCallback<[PostSummaryEntity]>)
    {
        RestClient.getArray("GetPostSummaryAll/\(lastPostId)/\(AppData.userGuid!)", callback: callback)
    }
    
    func getMyPostSummary(callback:InksellCallback<[PostSummaryEntity]>)
    {
        RestClient.getArray("GetMyPostSummary/\(AppData.userGuid!)", callback: callback)
    }
    
    func getFilteredPostSummary(lastPostId:Int, categoryType: CategoryType, callback:InksellCallback<[PostSummaryEntity]>)
    {
        RestClient.getArray("GetFilteredPostSummary/\(lastPostId)/\(categoryType.rawValue)/\(AppData.userGuid!)", callback: callback)
    }
    
    func deletePost(postId:Int, categoryType: CategoryType, callback:InksellCallback<Int>)
    {
        RestClient.getString("DeletePost/\(postId)/\(AppData.userGuid!)/\(categoryType.rawValue)", callback: callback)
    }
}