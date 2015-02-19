//
//  DetailViewController.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/11/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var segueTo: NSString = ""
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            segueTo = detail.description;
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        M_Scout.teams.printTeams();
    }
    
    override func viewDidAppear(animated: Bool) {
        if (segueTo != "") {
            self.performSegueWithIdentifier(segueTo, sender: self)
            segueTo = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

