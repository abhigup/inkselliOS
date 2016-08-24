//
//  BaseTableViewController.swift
//  inksell
//
//  Created by Abhinav Gupta on 15/02/16.
//  Copyright © 2016 inksell. All rights reserved.
//

import UIKit

class BaseTableViewController : BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [AnyObject] = []
    var tableViewCellIdentifier:[String] = []
    
    func initTableController(){}
    
    override func initController() {
        initTableController()
        
        for i in 0 ..< tableViewCellIdentifier.count
        {
            tableView.registerNib(UINib(nibName: tableViewCellIdentifier[i], bundle: nil), forCellReuseIdentifier: tableViewCellIdentifier[i])
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func setTableCell(indexPath:NSIndexPath, cell: UITableViewCell){}
    
    func getTableCell(indexPath : NSIndexPath) -> UITableViewCell{
        return tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier[indexPath.row], forIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = getTableCell(indexPath)
        
        setTableCell(indexPath, cell: cell)
        return cell
    }
    
    func reloadData()
    {
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}