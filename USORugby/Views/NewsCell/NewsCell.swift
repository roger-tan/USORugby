//
//  NewsCell.swift
//  USORugby
//
//  Created by Roger TAN on 01/09/15.
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class internal func nib() -> UINib {
        return UINib(nibName: "NewsCell", bundle: nil)
    }

    func configureForNews(news : News) {
        print(news.coverUrl);
        let url = NSURL(string: news.coverUrl);
        self.imageView.setImageWithURL(url!);
        self.titleLabel.text = news.title
        
        let gradientLayer: CAGradientLayer = CAGradientLayer(layer: layer)
        gradientLayer.frame = CGRectMake(0, 0, self.frame.width, 200)
        gradientLayer.colors = [UIColor.clearColor().CGColor, UIColor.grayColor().CGColor]
        gradientLayer.locations = [0.0, 1.0]
        self.imageView.layer.insertSublayer(gradientLayer, atIndex: 1);
//        self.imageView.setI
    }
}
