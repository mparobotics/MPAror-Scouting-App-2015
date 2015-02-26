//
//  MatchNotes.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/26/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class MatchNotes: UIViewController {
    
    @IBOutlet var matchNotes: UITextView!
    
    var teamData = Team()
    
    var matchNumber: Int = 0
    var matchColor: Int = -1
    var matchWinner: Int = -1
    var matchContribution: Int = -1
    var matchRating: Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        var matchCode: NSString = ""
        
        if (matchColor == matchWinner) {
            matchCode = "W"
        } else if (matchWinner == 2) {
            matchCode = "T"
        } else {
            matchCode = "L"
        }
        
        var contributionCode: NSString = ""
        
        switch matchContribution {
        case 0:
            contributionCode = "Least"
        case 1:
            contributionCode = "Medium"
        case 2:
            contributionCode = "Most"
        default:
            contributionCode = "Something is fucking broken. Call me. (651) 346-9760"
        }
        
        if (teamData.teamExists && teamData.matchNotes != "") {
            matchNotes.text = String(format: "%@\n\nMatch %d notes for team #%d (%@ %@ Contribution - Rated %d): \n\n", teamData.matchNotes, matchNumber, teamData.teamNumber, matchCode, contributionCode, matchRating)
        } else {
            matchNotes.text = String(format: "Match %d notes for team #%d (%@ %@ Contribution - Rated %d): \n\n", matchNumber, teamData.teamNumber, matchCode, contributionCode, matchRating)
        }
        
        matchNotes.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeNotesWindow(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveNotes(sender: AnyObject) {
        teamData.matchNotes = matchNotes.text
        
        if (matchColor == matchWinner) {
            teamData.wins++
        } else if (matchWinner == 2) {
            teamData.ties++
        } else {
            teamData.losses++
        }
        
        teamData.save()
        
        closeNotesWindow(self)
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
