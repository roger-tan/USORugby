//
//  NewsDetailView.swift
//  USORugby
//
//  Created by Roger TAN on 02/09/15.
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

import UIKit

class NewsDetailView: UIView, UIWebViewDelegate, UIScrollViewDelegate {

    var webView: UIWebView!
    var coverImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        self.coverImageView = UIImageView(frame: CGRectMake(0, 0, self.frame.width, 200));
        self.coverImageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.webView = UIWebView(frame: CGRectMake(0, 210, self.frame.width, 500));
        self.webView.scrollView.scrollEnabled = false;
        self.webView.delegate = self;
        
        self.scrollView.delegate = self
        self.scrollView.addSubview(self.coverImageView)
        self.scrollView.addSubview(self.webView)
    }
    
    func setContent(title: String!, date: NSDate!, content: String!) {
        
        let html = "<html><head><meta name=\"viewport\" content=\"width=device-width; minimum-scale=1.0; maximum-scale=1.0; user-scalable=no\"/><style type=\"text/css\">body {font-family: \"HelveticaNeue\"; margin-top: 0px; }</style></head><body>\(content)</body></html>";
        webView.loadHTMLString(html, baseURL: NSURL(string: "http://www.usorugby.com"));
    }
    
    func setHeader(urlCover: String!) {
        let urlCover = NSURL(string: urlCover)!
        self.coverImageView.setImageWithURL(urlCover)
    }
    
    // MARK: - UIWebViewDelegate
    func webViewDidFinishLoad(webView: UIWebView) {
        let webViewSize = webView.sizeThatFits(CGSizeMake(self.frame.width, 0.0))
        var webViewFrame = webView.frame
        webViewFrame.size =  webViewSize
        webView.frame = webViewFrame
        scrollView.contentSize = CGSizeMake(self.frame.width, CGRectGetHeight(webViewFrame) + 200)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var delta:CGFloat = 0.0
        var rect:CGRect = CGRectMake(0, 0, self.frame.width, 200)
        
        if (scrollView.contentOffset.y < 0) {
            delta = fabs(min(0.0, scrollView.contentOffset.y))
        }
        rect.origin.y -= delta
        rect.size.height += delta
        
        self.coverImageView.frame = rect
        self.coverImageView.layoutIfNeeded()
    }
    
}
