//
//  AddViewProtocol.swift
//  inksell
//
//  Created by Abhinav Gupta on 18/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation

protocol IAddViewProtocol {
    func verifyAndGetData(postEntity : IPostEntity, postCategory : CategoryType) -> Bool
}