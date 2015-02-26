//
//  AllianceMember.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/25/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class AllianceMember: UIViewController {
    
    @IBOutlet var teamTitle: UILabel!
    @IBOutlet var matchHistory: UILabel!
    @IBOutlet var notes: UITextView!
    
    var teamData = Team()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        teamTitle.text = String(format: "%d: %@",teamData.teamNumber, teamData.teamName)
        matchHistory.text = String(format: "W-L-T (%d-%d-%d)", teamData.wins, teamData.losses, teamData.ties)
        
        let autoString = "(Yellow Bins, Zone Change, Vision Track)"
        let totesString = "(Upright, Inverted, Flip)"
        let litterString = "(Landfill, Container, Ground)"
        notes.text = String(format: "Auto Height: %d %@\n\nTotes Height: %d %@\n\nLitter Height: %d %@\n\nContainer Height: %d\n\nNotes:\n%@\n\n", teamData.autoStack, autoString, teamData.totesStack, totesString, teamData.litterStack, litterString, teamData.containersStack, teamData.teamNotes, teamData.matchNotes)
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

}
