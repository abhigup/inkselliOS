//
//  BasePostsAddViewControllerCollectionViewExtention.swift
//  inksell
//
//  Created by Abhinav Gupta on 27/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

extension BasePostsAddViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as! ImageCell
        images[indexPath.row].fetchFullScreenImage(true, completeBlock: {
            (image, info) in
            cell.collectionView = collectionView
            cell.columnIndex = indexPath.row
            cell.collectionViewController = self
            cell.Image.image = image
        })
        return cell
    }
    
    func deleteColumnAtIndexPath(collectionView : UICollectionView, columnIndex: Int) {
        images.removeAtIndex(columnIndex)
        collectionView.reloadData()
    }
}