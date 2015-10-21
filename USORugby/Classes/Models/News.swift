//
//  News.swift
//  USORugby
//
//  Created by Roger TAN on 31/08/15.
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

import Foundation
import Parse

class News : PFObject, PFSubclassing {
    
    @NSManaged var title: String
    @NSManaged var content: String
    @NSManaged var originalLink: String
    @NSManaged var coverUrl: String

    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "News"
    }
}