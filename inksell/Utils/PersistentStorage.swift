//
//  LocalStorageHandler.swift
//  inksell
//
//  Created by Abhinav Gupta on 11/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class PersistentStorage {
    
    private let StorageName = "MyAppStorage" //Replace with yours
    static let sharedInstance = PersistentStorage()
    
    init()
    {
        if(defaults.dictionaryForKey(StorageName)==nil)
        {
            self.save()
        }
        else
        {
            dictionary = defaults.dictionaryForKey(StorageName)!
        }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()

    var dictionary = [String: AnyObject]()
    
    func clearAll()
    {
        dictionary = [:]
        self.save()
    }
    
    func saveData(key: String, object: AnyObject?)
    {
        dictionary[key] = object
        self.save()
    }
    
    func saveData<T:Mappable>(key: String, object: T)
    {
        dictionary[key] = Mapper().toJSONString(object)
        self.save()
    }
    
    func saveData<T:Mappable>(key: String, object: [T])
    {
        dictionary[key] = Mapper().toJSONString(object)
        self.save()
    }
    
    func getData<T:Mappable>(key: String) -> T?
    {
        if(dictionary[key] != nil)
        {
            let json = dictionary[key] as! String
            let object = Mapper<T>().map(json)
            return object
        }
        return nil
    }
    
    func getData<T:Mappable>(key: String) -> [T]?
    {
        if(dictionary[key] != nil)
        {
            let json = dictionary[key] as! String
            let list = Mapper<T>().mapArray(json)
            return list
        }
        return nil
    }
    
    func getData<T>(key: String) -> T?
    {
        if(dictionary[key] != nil)
        {
            return dictionary[key] as? T
        }
        return nil
    }
    
    private func save()
    {
        defaults.setObject(dictionary, forKey: StorageName)
        defaults.synchronize()
    }
    
}