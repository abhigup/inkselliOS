//
//  FilterPopoverController.swift
//  inksell
//
//  Created by Abhinav Gupta on 28/08/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import Foundation
import UIKit

class FilterPopoverController: BaseTableViewController{
    
    var homeDelegate : FilterToHomeProtocol?
    var selectedCategoryType = CategoryType.AllCategory
    
    override func initTableController() {
        selectedCategoryType = CategoryType(rawValue: passedObject as! Int)!
        self.tableViewCellIdentifier = ["FilterTableCell"]
        self.items = [CategoryType.AllCategory.rawValue,
                      CategoryType.Electronics.rawValue,
                      CategoryType.Automobile.rawValue,                      
                      CategoryType.Furniture.rawValue,
                      CategoryType.RealEstate.rawValue,
                      CategoryType.Others.rawValue]
    }
    
    override func setTableCell(indexPath:NSIndexPath, cell: UITableViewCell){
        let label = cell.viewWithTag(1) as! UILabel
        let categoryType = CategoryType(rawValue: self.items[indexPath.row] as! Int)!
        label.text = categoryType.getString()
        if(categoryType == selectedCategoryType)
        {
            label.textColor = UIColor.whiteColor()
            cell.backgroundColor = UIColor().pink_pressed()
        }
    }
    
    override func didSelectAtIndexPath(indexPath:NSIndexPath){
        let row = indexPath.row
        let categoryType = CategoryType(rawValue: row)
        homeDelegate?.updateTable(categoryType!)
        dismissViewControllerAnimated(true, completion: nil)
    }
}