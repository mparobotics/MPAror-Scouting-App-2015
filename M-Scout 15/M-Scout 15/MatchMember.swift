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
    
    var teamData = Team()
    var matchNumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateMatchNumber:", name: "org.team3926.scouting.2015.M-Scout.UpdateMatchMember", object: nil)
        
        teamTitle.text = String(format: "M%d - %d: %@", matchNumber, teamData.teamNumber, teamData.teamName)
        
        /*
        teamData.wins = 1;
        teamData.losses = 2;
        teamData.ties = 3;
        
        let autoString = "(Yellow Bins, Zone Change, Vision Track)"
        let totesString = "(Upright, Inverted, Flip)"
        let litterString = "(Landfill, Container, Ground)"
        notes.text = String(format: "Auto Height: %d %@\n\nTotes Height: %d %@\n\nLitter Height: %d %@\n\nContainer Height: %d\n\nNotes:\n%@", teamData.autoStack, autoString, teamData.totesStack, totesString, teamData.litterStack, litterString, teamData.containersStack, teamData.teamNotes)
        */
        
        updateSaveButton()
    }
    
    func updateMatchNumber(notification: NSNotification) {
        let userInfo:Dictionary<String,String!> = notification.userInfo as Dictionary<String,String!>
        let messageString: NSString = userInfo["message"]!
        
        matchNumber = messageString.integerValue
        teamTitle.text = String(format: "M%d - %d: %@", matchNumber, teamData.teamNumber, teamData.teamName)
        updateSaveButton()
    }
    
    func updateSaveButton() {
        if (matchNumber > 0) {
            saveButton.enabled = true
        } else {
            saveButton.enabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "allianceMemberDetail" {
            let navController = segue.destinationViewController as UINavigationController
            if (navController.viewControllers.count > 0) {
                let controller = navController.viewControllers[0] as TeamDetail
                controller.teamData = teamData
            }
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
