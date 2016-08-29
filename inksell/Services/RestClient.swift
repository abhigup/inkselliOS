//
//  RestClient.swift
//  inksell
//
//  Created by Abhinav Gupta on 10/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class RestClient{
    static let apiUrl = "http://inksell.cloudapp.net:8080/service1.svc/json"
    
    static let get = GetServices()
    static let post = PostServices()
    
    static func getString<T>(section:String,callback:InksellCallback<T>)
    {
        makeStringCall(Alamofire.Method.GET, section: section, body :nil, callback: callback)
    }
    
    static func getObject<T:Mappable>(section: String, callback:InksellCallback<T>)
    {
        makeObjectCall(Alamofire.Method.GET, section: section, body :nil, callback: callback)
    }
    
    static func getArray<T:Mappable>(section: String, callback:InksellCallback<[T]>)
    {
        makeArrayCall(Alamofire.Method.GET, section:section, body:nil, callback: callback)
    }
    
    static func postString<T, U:Mappable>(section: String, body:U, callback:InksellCallback<T>)    {
        makeStringCall(Alamofire.Method.POST, section: section, body :Mapper<U>().toJSON(body), callback: callback)
    }
    
    static func postObject<T:Mappable, U:Mappable>(section: String, body:U?, callback:InksellCallback<T>)
    {
        makeObjectCall(Alamofire.Method.POST, section: section, body: Mapper<U>().toJSON(body!), callback: callback)
    }
    
    static func postArray<T:Mappable, U:Mappable>(section: String, body:U?, callback:InksellCallback<[T]>)
    {
        makeArrayCall(Alamofire.Method.GET, section:section, body: Mapper<U>().toJSON(body!), callback: callback)
    }
    
    private static func makeStringCall<T>(method:Alamofire.Method, section: String, body: [String: AnyObject]?, callback:InksellCallback<T>)
    {
        Alamofire.request(method, "\(apiUrl)/\(section)", parameters: body, encoding: .JSON)
            .responseJSON{ response in
                
                    switch(response.result)
                    {
                    case .Failure(let error):
                        var err = error
                        break
                        
                    case .Success(let result):
                        callback.onResponse(result as? T)
                    }
        }
    }
    
    
    private static func makeObjectCall<T:Mappable>(method:Alamofire.Method, section: String, body: [String: AnyObject]?, callback:InksellCallback<T>)
    {
        Alamofire.request(method, "\(apiUrl)/\(section)", parameters: body, encoding: .JSON)
            .responseObject{ (response: Response<T, NSError>) -> Void in
                switch(response.result)
                {
                case .Failure(let error):
                    var err = error
                    break
                    
                case .Success(let result):
                    callback.onResponse(result)
                }
        }
    }
    
    private static func makeArrayCall<T:Mappable>(method:Alamofire.Method, section: String, body: [String: AnyObject]?, callback:InksellCallback<[T]>)
    {
        Alamofire.request(method, "\(apiUrl)/\(section)", parameters: body, encoding: .JSON)
            .responseArray{ (response: Response<[T], NSError>) -> Void in
                switch(response.result)
                {
                case .Failure(let error): break
                    
                case .Success(let result):
                    callback.onResponse(result)
                }
        }
    }
}
