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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetView() {
        teamName.text = ""
        teamNumber.text = ""
        hasAuto.selectedSegmentIndex = -1
        hasTotes.selectedSegmentIndex = -1
        hasLitter.selectedSegmentIndex = -1
        hasContainers.selectedSegmentIndex = -1
        driveStyle.selectedSegmentIndex = -1
        teamRating.selectedSegmentIndex = -1
        autoStackControl.value = 0
        totesStackControl.value = 0
        litterStackControl.value = 0
        containersStackControl.value = 0
        updateScoringCategories(self)
        updateStackLevels(self)
    }

    @IBAction func updateScoringCategories(sender: AnyObject) {
        if (hasAuto.selectedSegmentIndex == 0) {
            //Enable category
            autoStackControl.enabled = true
            autoStack.enabled = true
            canYellowBins.enabled = true
            canZoneChange.enabled = true
            canVisionTrack.enabled = true
        } else {
            //Disable category
            autoStackControl.enabled = false
            autoStack.enabled = false
            canYellowBins.enabled = false
            canZoneChange.enabled = false
            canVisionTrack.enabled = false
        }
        
        if (hasTotes.selectedSegmentIndex == 0) {
            //Enable category
            totesStackControl.enabled = true
            totesStack.enabled = true
            canUpright.enabled = true
            canInverted.enabled = true
            canFlip.enabled = true
        } else {
            //Disable category
            totesStackControl.enabled = false
            totesStack.enabled = false
            canUpright.enabled = false
            canInverted.enabled = false
            canFlip.enabled = false
        }
        
        if (hasLitter.selectedSegmentIndex == 0) {
            //Enable category
            litterStackControl.enabled = true
            litterStack.enabled = true
            canLandfill.enabled = true
            canContainer.enabled = true
            canGround.enabled = true
        } else {
            //Disable category
            litterStackControl.enabled = false
            litterStack.enabled = false
            canLandfill.enabled = false
            canContainer.enabled = false
            canGround.enabled = false
        }
        
        if (hasContainers.selectedSegmentIndex == 0) {
            //Enable category
            containersStackControl.enabled = true
            containersStack.enabled = true
        } else {
            //Disable category
            containersStackControl.enabled = false
            containersStack.enabled = false
        }
    }
    
    @IBAction func updateStackLevels(sender: AnyObject) {
        autoStack.text = String(format: "%d", Int(autoStackControl.value))
        totesStack.text = String(format: "%d", Int(totesStackControl.value))
        litterStack.text = String(format: "%d", Int(litterStackControl.value))
        containersStack.text = String(format: "%d", Int(containersStackControl.value))
    }
    
    @IBAction func tapOutsideTextview(sender: AnyObject) {
        teamNumber.resignFirstResponder()
        teamName.resignFirstResponder()
    }
    
    @IBAction func saveTeam(sender: AnyObject) {
        resetView()
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
