//
//  CallbackProtocol.swift
//  inksell
//
//  Created by Abhinav Gupta on 26/01/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation

class InksellCallback<T>
{
    var onSuccess: (T?) -> ()
    var onFailure: (ResponseStatus) -> ()
    
    init(success:(T?)->())
    {
        onSuccess = success
        onFailure = {_ in}
    }
    
    init(success:(T?)->(), failure:(ResponseStatus)->())
    {
        onSuccess = success
        onFailure = failure
    }
    
    final func onResponse(data:T?){
        onSuccess(data)
    }
    
    final func onError(error:NSError)
    {
        
    }
}