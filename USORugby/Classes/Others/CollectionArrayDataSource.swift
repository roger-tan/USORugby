//
//  CollectionArrayDataSource.swift
//  USORugby
//
//  Created by Roger TAN on 02/09/15.
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

import Foundation


typealias CollectionViewCellConfigureBlock = (cell : AnyObject?, item: AnyObject?) -> Void;

class CollectionArrayDataSource : NSObject, UICollectionViewDataSource {
    
    var items: NSArray!;
    var cellIdentifier: String!;
    var configureCellBlock: CollectionViewCellConfigureBlock!;
    
    
    init(items: NSArray, cellIdentifier: String, configureCellBlock: CollectionViewCellConfigureBlock) {
        self.items = items;
        self.cellIdentifier = cellIdentifier;
        self.configureCellBlock = configureCellBlock;
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject? {
        return self.items[indexPath.row];
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(self.cellIdentifier, forIndexPath: indexPath)
        
        let item: AnyObject? = self.itemAtIndexPath(indexPath);
        self.configureCellBlock(cell: cell, item: item);
        
        return cell;
    }
}