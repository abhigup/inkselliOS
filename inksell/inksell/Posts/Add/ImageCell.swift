//
//  ImageCell.swift
//  inksell
//
//  Created by Abhinav Gupta on 27/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var Image: UIImageView!
    var columnIndex:Int = 0
    var collectionView: UICollectionView!
    var collectionViewController:BasePostsAddViewController!
    
    @IBAction func deleteImage(sender: AnyObject) {
        collectionViewController.deleteColumnAtIndexPath(collectionView, columnIndex: columnIndex)
    }
}