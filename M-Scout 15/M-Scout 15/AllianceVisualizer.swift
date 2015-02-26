//
//  AllianceVisualizer.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/25/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class AllianceVisualizer: UIViewController {
    @IBOutlet var matchNumber: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func matchNumberChanged(sender: AnyObject) {
        let fieldText = matchNumber.text as NSString
        if (fieldText.integerValue > 0) {
            NSNotificationCenter.defaultCenter().postNotificationName("org.team3926.scouting.2015.M-Scout.UpdateMatchMember", object: self, userInfo:["message":matchNumber.text])
        }
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
