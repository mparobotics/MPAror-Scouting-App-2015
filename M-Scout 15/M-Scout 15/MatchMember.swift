//
//  MatchMember.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/25/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class MatchMember: UIViewController {
    
    @IBOutlet var teamTitle: UILabel!
    @IBOutlet var matchContribution: UISegmentedControl!
    @IBOutlet var matchRating: UISlider!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var matchRatingLabel: UILabel!
    
    var teamData = Team()
    var matchNumber:Int = 0
    var matchColor:Int = -1
    var matchWinner:Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateMatchNumber:", name: "org.team3926.scouting.2015.M-Scout.UpdateMatchMember", object: nil)
        
        teamTitle.text = String(format: "M%d - %d: %@", matchNumber, teamData.teamNumber, teamData.teamName)
        
        updateSaveButton()
    }
    
    func updateMatchNumber(notification: NSNotification) {
        let userInfo:Dictionary<String,String!> = notification.userInfo as Dictionary<String,String!>
        let messageString: NSString = userInfo["message"]!
        let winnerString: NSString = userInfo["details"]!
        
        matchNumber = messageString.integerValue
        matchWinner = winnerString.integerValue
        teamTitle.text = String(format: "M%d - %d: %@", matchNumber, teamData.teamNumber, teamData.teamName)
        updateSaveButton()
    }
    
    @IBAction func ratingChanged(sender: AnyObject) {
        matchRatingLabel.text = String(format: "%d", Int(matchRating.value))
    }
    
    func updateSaveButton() {
        if (matchNumber > 0 && matchContribution.selectedSegmentIndex >= 0) {
            saveButton.enabled = true
        } else {
            saveButton.enabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func contributionChanged(sender: AnyObject) {
        updateSaveButton()
    }

    @IBAction func saveTeam(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "matchNotes" {
            let controller = (segue.destinationViewController as UINavigationController).topViewController as MatchNotes
            controller.teamData = teamData
            controller.matchNumber = matchNumber
            controller.matchColor = matchColor
            controller.matchWinner = matchWinner
            controller.matchContribution = matchContribution.selectedSegmentIndex
            controller.matchRating = Int(matchRating.value)
        }
    }

}
