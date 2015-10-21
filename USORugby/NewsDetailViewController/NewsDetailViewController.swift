//
//  NewsDetailViewController.swift
//  USORugby
//
//  Created by Roger TAN on 02/09/15.
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    var newsDetailView : NewsDetailView!
    var news: News?;
    
    // MARK: - UIViewController 
    
    override func loadView() {
        super.loadView()
        let view = NSBundle.mainBundle().loadNibNamed("NewsDetailView", owner: self, options: nil)
        newsDetailView = view[0] as! NewsDetailView
        self.view = newsDetailView;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if news != nil {
            newsDetailView.setContent(news?.title, date: news?.createdAt, content: news?.content)
            newsDetailView.setHeader(news?.coverUrl)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
