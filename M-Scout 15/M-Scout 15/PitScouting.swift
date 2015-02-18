//
//  PitScouting.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/17/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class PitScouting: UIViewController {

    
    @IBOutlet var teamNumber: UITextField!
    @IBOutlet var teamName: UITextField!
    
    @IBOutlet var hasAuto: UISegmentedControl!
    @IBOutlet var hasTotes: UISegmentedControl!
    @IBOutlet var hasContainers: UISegmentedControl!
    @IBOutlet var hasLitter: UISegmentedControl!
    
    @IBOutlet var driveStyle: UISegmentedControl!
    
    @IBOutlet var autoStackControl: UIStepper!
    @IBOutlet var autoStack: UILabel!
    @IBOutlet var canYellowBins: UISwitch!
    @IBOutlet var canZoneChange: UISwitch!
    @IBOutlet var canVisionTrack: UISwitch!
    
    @IBOutlet var totesStackControl: UIStepper!
    @IBOutlet var totesStack: UILabel!
    @IBOutlet var canUpright: UISwitch!
    @IBOutlet var canInverted: UISwitch!
    @IBOutlet var canFlip: UISwitch!
    
    @IBOutlet var litterStackControl: UIStepper!
    @IBOutlet var litterStack: UILabel!
    @IBOutlet var canLandfill: UISwitch!
    @IBOutlet var canContainer: UISwitch!
    @IBOutlet var canGround: UISwitch!
    
    @IBOutlet var containersStackControl: UIStepper!
    @IBOutlet var containersStack: UILabel!
    
    @IBOutlet var teamRating: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        M_Scout.teams.printTeams();
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
