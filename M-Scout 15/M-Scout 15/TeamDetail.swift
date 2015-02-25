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
    
    var teamData = Team()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        teamData.wins = 1;
        teamData.losses = 2;
        teamData.ties = 3;
        teamTitle.text = String(format: "%d: %@ (%d-%d-%d)",teamData.teamNumber, teamData.teamName, teamData.wins, teamData.losses, teamData.ties)
        
        if (teamData.robotImageSet) {
            robotImage.image = teamData.robotImage
        } else {
            robotImage.image = UIImage(named: "M-Scout")
        }
        
        teamNotes.text = teamData.teamNotes
        driveStyle.selectedSegmentIndex = teamData.driveStyle
        
        autoStackHeight.text = String(format: "Autonymous Stack Height: %d",teamData.autoStack)
        toteStackHeight.text = String(format: "Tote Stack Height: %d",teamData.totesStack)
        litterStackHeight.text = String(format: "Litter Stack Height: %d",teamData.litterStack)
        containerStackHeight.text = String(format: "Container Stack Height: %d",teamData.containersStack)
        
        teamRating.text = String(format: "%d", teamData.teamRating+1)
        
        if (teamData.canYellowBins) {
            canYellowBins.image = UIImage(named: "MPArorLogo")
        } else {
            canYellowBins.image = UIImage(named: "M-Scout")
        }
        if (teamData.canZoneChange) {
            canZoneChange.image = UIImage(named: "MPArorLogo")
        } else {
            canZoneChange.image = UIImage(named: "M-Scout")
        }
        if (teamData.canVisionTrack) {
            canVisionTrack.image = UIImage(named: "MPArorLogo")
        } else {
            canVisionTrack.image = UIImage(named: "M-Scout")
        }
        
        if (teamData.canUpright) {
            canUpright.image = UIImage(named: "MPArorLogo")
        } else {
            canUpright.image = UIImage(named: "M-Scout")
        }
        if (teamData.canInverted) {
            canInverted.image = UIImage(named: "MPArorLogo")
        } else {
            canInverted.image = UIImage(named: "M-Scout")
        }
        if (teamData.canFlip) {
            canFlip.image = UIImage(named: "MPArorLogo")
        } else {
            canFlip.image = UIImage(named: "M-Scout")
        }
        
        if (teamData.canLandfill) {
            canLandfill.image = UIImage(named: "MPArorLogo")
        } else {
            canLandfill.image = UIImage(named: "M-Scout")
        }
        if (teamData.canContainer) {
            canContainer.image = UIImage(named: "MPArorLogo")
        } else {
            canContainer.image = UIImage(named: "M-Scout")
        }
        if (teamData.canGround) {
            canGround.image = UIImage(named: "MPArorLogo")
        } else {
            canGround.image = UIImage(named: "M-Scout")
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
