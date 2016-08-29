//
//  ImagesView.swift
//  inksell
//
//  Created by Abhinav Gupta on 20/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import Material
import ImagePicker

class ImagesAddCell: BaseTableViewCell {
    
    @IBOutlet weak var ImageCollectionView: UICollectionView!
    var imagePickerDelegate : IImagePickerProtocol?
    
    @IBAction func addImages(sender: AnyObject) {
        imagePickerDelegate?.presentImagePickerController(self)
    }
    
    func setDelegate
        <D: protocol<UICollectionViewDataSource, UICollectionViewDelegate, IImagePickerProtocol>>
        (dataSourceDelegate: D) {
        imagePickerDelegate = dataSourceDelegate
        ImageCollectionView.delegate = dataSourceDelegate
        ImageCollectionView.dataSource = dataSourceDelegate
        ImageCollectionView.setContentOffset(ImageCollectionView.contentOffset, animated:false)
        
        ImageCollectionView.registerNib(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        ImageCollectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set {
            ImageCollectionView.contentOffset.x = newValue
        }
        
        get {
            return ImageCollectionView.contentOffset.x
        }
    }
    
    func reloadData() {
        ImageCollectionView.reloadData()
    }
    
}