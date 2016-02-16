//
//  TableViewCellWithoutPic.swift
//  inksell
//
//  Created by Abhinav Gupta on 15/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit

class TableViewCellWithoutPic: UITableViewCell {

    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var PostedBy: UILabel!
    @IBOutlet weak var PostedOn: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserImageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
