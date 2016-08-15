//
//  TableViewCellWithoutPic.swift
//  inksell
//
//  Created by Abhinav Gupta on 15/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit
import Material

class TableViewCellWithoutPic: MaterialTableViewCell{

    @IBOutlet weak var CellView: UIView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var PostedBy: UILabel!
    @IBOutlet weak var PostedOn: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserImageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        CellView.layer.shadowColor = UIColor().DarkGreyColor().CGColor
        CellView.layer.shadowOpacity = 1
        CellView.layer.shadowOffset = CGSizeZero
        CellView.layer.shadowRadius = 5
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
