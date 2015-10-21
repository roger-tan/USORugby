//
//  FeedsViewController.swift
//  USORugby
//
//  Created by Roger TAN on 31/08/15.
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController, UICollectionViewDelegate {
    let kNewsCellIdentifier = "NewsCell"
    
    // MARK: - Properties
    var feedsView: FeedsView!
    var newsArrayDataSource: ArrayDataSource!

    // MARK: - UIViewController
    
    override func loadView() {
        super.loadView()
        let view = NSBundle.mainBundle().loadNibNamed("FeedsView", owner: self, options: nil)
        feedsView = view[0] as! FeedsView
        self.view = feedsView;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Setups
    
    func setupCollectionView() {
        self.feedsView.collectionView.delegate = self;
        let configureCell: CellConfigureBlock = { (cell, news) -> () in
            let innerCell = cell as? NewsCell;
            let innerNews = news as? News;
            innerCell!.configureForNews(innerNews!)
        }
        News.findAll { (news, error) -> Void in
            self.newsArrayDataSource = ArrayDataSource(items: news!, cellIdentifier: self.kNewsCellIdentifier, configureCellBlock: configureCell);
            self.feedsView.collectionView.dataSource = self.newsArrayDataSource;
            self.feedsView.collectionView.registerNib(NewsCell.nib(), forCellWithReuseIdentifier: self.kNewsCellIdentifier);
        }
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let newsDetailViewController = NewsDetailViewController()
        newsDetailViewController.news = newsArrayDataSource.itemAtIndexPath(indexPath) as? News
        self.navigationController?.pushViewController(newsDetailViewController, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let deviceSize = UIScreen.mainScreen().bounds.size
        
        return CGSize(width: deviceSize.width , height: 200)
        
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
