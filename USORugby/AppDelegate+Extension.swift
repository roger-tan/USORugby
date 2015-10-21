//
//  AppDelegate+Exntension.swift
//  USORugby
//
//  Created by Roger TAN on 01/09/15.
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

import Foundation
import Parse

extension AppDelegate {

    // Select the initial Windows
    func initializeWindows() {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: FeedsViewController())
        self.window?.makeKeyAndVisible()
    }
    
    func initializeParse(launchOptions: [NSObject: AnyObject]?) {
        Parse.enableLocalDatastore()
        
        // Register Parse Object
        
        News.registerSubclass()
        // Initialize Parse.
        Parse.setApplicationId("j2CsIT0ONh5HHN0aDTrAze2YYv8RuSpfrfvc2YHU",
            clientKey: "8Nvf0TK7Jjkif72WrfTJDJoo6KvH0hCYqrkyWvDb")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
    }
    
}