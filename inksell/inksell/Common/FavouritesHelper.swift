//
//  FavouritesHelper.swift
//  inksell
//
//  Created by Abhinav Gupta on 30/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation

class FavouritesHelper {
    
    static var postSummaryEntities : [PostSummaryEntity] = []
    
    static func IsFavourite(postId : Int) -> Bool
    {
        for entity in postSummaryEntities {
            if(entity.PostId == postId){
                return true
            }
        }
        return false
    }
    
    static func ToggleFavourite(postSummary : PostSummaryEntity){
        if(IsFavourite(postSummary.PostId!)) {
            RemoveFromFavourite(postSummary.PostId!)
        }
        else{
            AddToFavourite(postSummary)
        }
    }
    
    static func AddToFavourite(postSummary : PostSummaryEntity)
    {
        postSummaryEntities.append(postSummary)
        saveToLocalStorage()
    }
    
    static func RemoveFromFavourite(postId : Int)
    {
        var index : Int = 0
        for entity in postSummaryEntities {
            if(entity.PostId == postId){
                postSummaryEntities.removeAtIndex(index)
                break
            }
            index += 1
        }
        saveToLocalStorage()
    }
    
    static func ClearAll()
    {
        postSummaryEntities.removeAll()
    }
    
    static func GetFavourites() -> [PostSummaryEntity]
    {
        if(postSummaryEntities.isEmpty)
        {
            postSummaryEntities = PersistentStorage.sharedInstance.getData(StorageConstants.Favourites)!
        }
        return postSummaryEntities
    }
    
    private static func saveToLocalStorage()
    {
        PersistentStorage.sharedInstance.saveData(StorageConstants.Favourites, object: postSummaryEntities)
    }
}