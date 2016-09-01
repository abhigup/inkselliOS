//
//  AzureStorageHelper.swift
//  inksell
//
//  Created by Abhinav Gupta on 01/09/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit
import AZSClient

class AzureStorageHelper {
    
    private static let storageConnectionString =
    "DefaultEndpointsProtocol=http;" +
    "AccountName=inksell;" +
    "AccountKey=r6nE+8icgTm468ie3pwNSY4NKP6MlGeQ2KtuajknKBsAh/uIrd/NSBYpBSB2ZT/IzvisFfwGE1zFcoPb+38kKA==";
    
    static func UploadPic(images: [UIImage], containerName: String, callback: (isSuccess : Bool, imagesUrls : [String]?) -> ()) -> Bool
    {
        do{
            let account = try AZSCloudStorageAccount(fromConnectionString:storageConnectionString)
            let blobClient: AZSCloudBlobClient = account.getBlobClient()
            let blobContainer: AZSCloudBlobContainer = blobClient.containerReferenceFromName(containerName)
            
            blobContainer.createContainerIfNotExistsWithAccessType(AZSContainerPublicAccessType.Container, requestOptions: nil, operationContext: nil) { (NSError, Bool) -> Void in
                if ((NSError) != nil){
                    NSLog("Error in creating container.")
                    callback(isSuccess: false, imagesUrls: nil)
                }
                else {
                    uploadBlobSync(blobContainer, containerName: containerName, index: 0, images: images, imageUrls: [], callback: callback)
                }
            }
            return true
        }
        catch
        {
            print("Error")
            return false
        }
    }

    private static func uploadBlobSync(blobContainer : AZSCloudBlobContainer, containerName : String, index : Int, images :[UIImage], imageUrls : [String], callback: (Bool, [String]?) -> ())
    {
        if(images.count == index)
        {
            callback(true, imageUrls)
            return
        }
        
        var mutatingImageUrls = imageUrls
        let imagesData = UIImageJPEGRepresentation(images[index], 0.5)!
        let imageName = getImageName()
        let blob: AZSCloudBlockBlob = blobContainer.blockBlobReferenceFromName(imageName)
        blob.uploadFromData(imagesData, completionHandler: {(NSError) -> Void in
            NSLog("Ok, uploaded !")
            mutatingImageUrls.append("http://inksell.blob.core.windows.net/\(containerName)/\(imageName)");
            uploadBlobSync(blobContainer, containerName: containerName, index: index + 1, images: images, imageUrls: mutatingImageUrls, callback: callback)
        })
    }
    
    private static func getImageName() -> String
    {
        let userName = AppData.userData?.CorporateEmail?.componentsSeparatedByString("@")[0];
        let imageId = (AppData.userData?.CompanyId)! + (AppData.userData?.LocationId)!;
        let ticks = NSDate().timeIntervalSince1970;
        return userName! + "\(imageId)\(ticks)";
    }
}