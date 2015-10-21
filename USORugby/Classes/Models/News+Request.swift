//
//  News+Extension.swift
//  USORugby
//
//  Created by Roger TAN on 31/08/15.
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

import Foundation

extension News {
    
     internal class func findAll(completion: (news: NSArray?, error: NSError?) -> Void) {
        let query = News.query();
        query?.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
            if error != nil {
                completion(news: nil, error: error)
            } else {
                completion(news: objects, error: nil);
            }
        });
    }
}