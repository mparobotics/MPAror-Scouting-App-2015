//
//  TeamDetail.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/23/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class TeamDetail: UIViewController {
    
    @IBOutlet var canGround: UIImageView!
    @IBOutlet var canContainer: UIImageView!
    @IBOutlet var canLandfill: UIImageView!
    @IBOutlet var canFlip: UIImageView!
    @IBOutlet var canInverted: UIImageView!
    @IBOutlet var canUpright: UIImageView!
    @IBOutlet var canVisionTrack: UIImageView!
    @IBOutlet var canZoneChange: UIImageView!
    @IBOutlet var canYellowBins: UIImageView!
    @IBOutlet var teamRating: UILabel!
    @IBOutlet var containerStackHeight: UILabel!
    @IBOutlet var litterStackHeight: UILabel!
    @IBOutlet var toteStackHeight: UILabel!
    @IBOutlet var autoStackHeight: UILabel!
    @IBOutlet var driveStyle: UISegmentedControl!
    @IBOutlet var teamNotes: UITextView!
    @IBOutlet var robotImage: UIImageView!
    @IBOutlet var teamTitle: UILabel!
    @IBOutlet var closeButton: UIBarButtonItem!
    
    var teamData = Team()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        teamTitle.text = String(format: "%d: %@ (%d-%d-%d)",teamData.teamNumber, teamData.teamName, teamData.wins, teamData.losses, teamData.ties)
        
        if (teamData.robotImageSet) {
            robotImage.image = teamData.robotImage
        } else {
            robotImage.image = UIImage(named: "M-Scout")
        }
        
        teamNotes.text = String(format: "%@\n\n%@", teamData.teamNotes, teamData.matchNotes)
        driveStyle.selectedSegmentIndex = teamData.driveStyle
        
        autoStackHeight.text = String(format: "Autonymous Stack Height: %d",teamData.autoStack)
        toteStackHeight.text = String(format: "Tote Stack Height: %d",teamData.totesStack)
        litterStackHeight.text = String(format: "Litter Stack Height: %d",teamData.litterStack)
        containerStackHeight.text = String(format: "Container Stack Height: %d",teamData.containersStack)
        
        teamRating.text = String(format: "%d", teamData.teamRating+1)
        
        if (teamData.canYellowBins) {
            canYellowBins.image = UIImage(named: "Check")
        } else {
            canYellowBins.image = UIImage(named: "X")
        }
        if (teamData.canZoneChange) {
            canZoneChange.image = UIImage(named: "Check")
        } else {
            canZoneChange.image = UIImage(named: "X")
        }
        if (teamData.canVisionTrack) {
            canVisionTrack.image = UIImage(named: "Check")
        } else {
            canVisionTrack.image = UIImage(named: "X")
        }
        
        if (teamData.canUpright) {
            canUpright.image = UIImage(named: "Check")
        } else {
            canUpright.image = UIImage(named: "X")
        }
        if (teamData.canInverted) {
            canInverted.image = UIImage(named: "Check")
        } else {
            canInverted.image = UIImage(named: "X")
        }
        if (teamData.canFlip) {
            canFlip.image = UIImage(named: "Check")
        } else {
            canFlip.image = UIImage(named: "X")
        }
        
        if (teamData.canLandfill) {
            canLandfill.image = UIImage(named: "Check")
        } else {
            canLandfill.image = UIImage(named: "X")
        }
        if (teamData.canContainer) {
            canContainer.image = UIImage(named: "Check")
        } else {
            canContainer.image = UIImage(named: "X")
        }
        if (teamData.canGround) {
            canGround.image = UIImage(named: "Check")
        } else {
            canGround.image = UIImage(named: "X")
        }
    }
    
    @IBAction func closeWindow(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
