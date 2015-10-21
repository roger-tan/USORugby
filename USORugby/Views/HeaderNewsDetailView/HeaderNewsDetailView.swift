//
//  HeaderNewsDetailView.swift
//  USORugby
//
//  Created by Roger TAN on 03/09/15.
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

import UIKit

class HeaderNewsDetailView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    
    
    internal class func instantiateFromNib() -> HeaderNewsDetailView? {
        let views = NSBundle.mainBundle().loadNibNamed("HeaderNewsDetailView", owner: nil, options: nil);
        return views[0] as? HeaderNewsDetailView;
    }
//    {
//    NSArray *views = [[NSBundle mainBundle] loadNibNamed:[NSString stringWithFormat:@"%@", [self class]] owner:nil options:nil];
//    return [views firstObject];
//    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
