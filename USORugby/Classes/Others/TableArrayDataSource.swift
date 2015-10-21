//
//  TableArrayDataSource.swift
//  USORugby
//
//  Created by Roger TAN on 02/09/15.
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

import Foundation

typealias TableViewCellConfigureBlock = (cell : AnyObject?, item: AnyObject?) -> Void;

class TableArrayDataSource : NSObject, UITableViewDataSource {
    
    var items: NSArray!;
    var cellIdentifier: String!;
    var configureCellBlock: TableViewCellConfigureBlock!;
    
    
    init(items: NSArray, cellIdentifier: String, configureCellBlock: TableViewCellConfigureBlock) {
        self.items = items;
        self.cellIdentifier = cellIdentifier;
        self.configureCellBlock = configureCellBlock;
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject? {
        return self.items[indexPath.row];
    }
    
    // MARK : UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath) 
        
        let item: AnyObject? = self.itemAtIndexPath(indexPath);
        self.configureCellBlock(cell: cell, item: item);
        
        return cell;
    }
}