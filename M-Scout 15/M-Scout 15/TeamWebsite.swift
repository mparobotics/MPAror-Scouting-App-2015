//
//  TeamWebsite.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/23/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit
import WebKit

class TeamWebsite: UIViewController {

    @IBOutlet var containerView : UIView! = nil
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView()
        self.view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string:"http://www.team3926.org/")
        var req = NSURLRequest(URL:url!)
        self.webView!.loadRequest(req)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
