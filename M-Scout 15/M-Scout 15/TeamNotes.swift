//
//  TeamNotes.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/23/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class TeamNotes: UIViewController {

    @IBOutlet var teamNotes: UITextView!
    
    var teamNumber: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var currentTeam:Team = Team(number: teamNumber)
        
        if (currentTeam.teamExists && currentTeam.teamNotes != "") {
            teamNotes.text = currentTeam.teamNotes
        } else {
            teamNotes.text = String(format: "Team notes for team #%d: \n\n", teamNumber)
        }
        
        teamNotes.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeWindow(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveNotes(sender: AnyObject) {
        var currentTeam:Team = Team(number: teamNumber)
        
        currentTeam.teamNotes = teamNotes.text
        
        currentTeam.save()
        
        closeWindow(self)
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
