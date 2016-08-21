//
//  BaseTableViewCell.swift
//  inksell
//
//  Created by Abhinav Gupta on 21/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit
import Material

class BaseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CellView: UIView!
    
    func initCell(){}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        CellView.layer.shadowColor = UIColor().DarkGreyColor().CGColor
        CellView.layer.shadowOpacity = 1
        CellView.layer.shadowOffset = CGSizeZero
        CellView.layer.shadowRadius = 5
        
        initCell()
        // Initialization code
    }
}