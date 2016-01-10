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
    static let apiUrl = "http://inksell.cloudapp.net:8080/service1.svc/json/"
    
    static let get = GetServices()
    static let post = PostServices()
    
    static func getObject<T:Mappable>(section: String, completionHandler: (T?) -> Void)
    {
        makeObjectCall(Alamofire.Method.GET, section: section, body :nil, completionHandler: completionHandler)
    }
    
    static func getArray<T:Mappable>(section: String, completionHandler: ([T]?) -> Void)
    {
        makeArrayCall(Alamofire.Method.GET, section:section, body:nil, completionHandler: completionHandler)
    }
    
    static func postObject<T:Mappable, U:Mappable>(section: String, body:U?, completionHandler: (T?) -> Void)
    {
        makeObjectCall(Alamofire.Method.POST, section: section, body: Mapper<U>().toJSON(body!), completionHandler: completionHandler)
    }
    
    static func postArray<T:Mappable, U:Mappable>(section: String, body:U?, completionHandler: ([T]?) -> Void)
    {
        makeArrayCall(Alamofire.Method.GET, section:section, body: Mapper<U>().toJSON(body!), completionHandler: completionHandler)
    }
    
    
    private static func makeObjectCall<T:Mappable>(method:Alamofire.Method, section: String, body: [String: AnyObject]?, completionHandler: (T?) -> Void)
    {
        Alamofire.request(method, "\(apiUrl)/\(section)", parameters: body, encoding: .JSON)
            .responseObject{ (response: Response<T, NSError>) -> Void in
                switch(response.result)
                {
                case .Failure(let error): break
                    
                case .Success(let result):
                    completionHandler(result)
                }
        }
    }
    
    private static func makeArrayCall<T:Mappable>(method:Alamofire.Method, section: String, body: [String: AnyObject]?, completionHandler: ([T]?) -> Void)
    {
        Alamofire.request(method, "\(apiUrl)/\(section)", parameters: body, encoding: .JSON)
            .responseArray{ (response: Response<[T], NSError>) -> Void in
                switch(response.result)
                {
                case .Failure(let error): break
                    
                case .Success(let result):
                    completionHandler(result)
                }
        }
    }
}
