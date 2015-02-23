//
//  PitScouting.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/17/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class PitScouting: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var teamNumber: UITextField!
    @IBOutlet var teamName: UITextField!
    
    @IBOutlet var robotImage: UIImageView!
    
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
    
    @IBOutlet var teamNotes: UIButton!
    @IBOutlet var saveTeam: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        teamNumber.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetView() {
        teamName.text = ""
        teamNumber.text = ""
        
        robotImage.userInteractionEnabled = false
        robotImage.image = UIImage(named: "M-Scout")
        
        hasAuto.selectedSegmentIndex = -1
        hasTotes.selectedSegmentIndex = -1
        hasLitter.selectedSegmentIndex = -1
        hasContainers.selectedSegmentIndex = -1
        driveStyle.selectedSegmentIndex = -1
        teamRating.selectedSegmentIndex = -1
        
        teamName.enabled = false
        hasAuto.enabled = false
        hasTotes.enabled = false
        hasLitter.enabled = false
        hasContainers.enabled = false
        driveStyle.enabled = false
        teamRating.enabled = false
        
        autoStackControl.value = 0
        totesStackControl.value = 0
        litterStackControl.value = 0
        containersStackControl.value = 0
        
        canYellowBins.on = false
        canZoneChange.on = false
        canVisionTrack.on = false
        canUpright.on = false
        canInverted.on = false
        canFlip.on = false
        canLandfill.on = false
        canContainer.on = false
        canGround.on = false
        
        teamNotes.enabled = false
        saveTeam.enabled = false
        
        updateScoringCategories(self)
        updateStackLevels(self)
    }
    
    func loadTeam() {
        var currentTeam:Team = Team(number: teamNumber.text.toInt()!)
        if (currentTeam.teamExists) {
            teamName.text = currentTeam.teamName
            
            robotImage.image = currentTeam.robotImage
            
            if (currentTeam.hasAuto) {
                hasAuto.selectedSegmentIndex = 0
            } else {
                hasAuto.selectedSegmentIndex = 1
            }
            
            if (currentTeam.hasTotes) {
                hasTotes.selectedSegmentIndex = 0
            } else {
                hasTotes.selectedSegmentIndex = 1
            }
            
            if (currentTeam.hasContainers) {
                hasContainers.selectedSegmentIndex = 0
            } else {
                hasContainers.selectedSegmentIndex = 1
            }
            
            if (currentTeam.hasLitter) {
                hasLitter.selectedSegmentIndex = 0
            } else {
                hasLitter.selectedSegmentIndex = 1
            }
            
            driveStyle.selectedSegmentIndex = currentTeam.driveStyle
            
            autoStackControl.value = Double(currentTeam.autoStack)
            canYellowBins.on = currentTeam.canYellowBins
            canZoneChange.on = currentTeam.canZoneChange
            canVisionTrack.on = currentTeam.canVisionTrack
            
            totesStackControl.value = Double(currentTeam.totesStack)
            canUpright.on = currentTeam.canUpright
            canInverted.on = currentTeam.canInverted
            canFlip.on = currentTeam.canFlip
            
            litterStackControl.value = Double(currentTeam.litterStack)
            canLandfill.on = currentTeam.canLandfill
            canContainer.on = currentTeam.canContainer
            canGround.on = currentTeam.canGround
            
            containersStackControl.value = Double(currentTeam.containersStack)
            
            teamRating.selectedSegmentIndex = currentTeam.teamRating
            
            updateScoringCategories(self)
        }
    }

    @IBAction func teamNumberEntered(sender: AnyObject) {
        if (teamNumber.text.toInt() > 0) {
            teamName.enabled = true
            hasAuto.enabled = true
            hasTotes.enabled = true
            hasLitter.enabled = true
            hasContainers.enabled = true
            driveStyle.enabled = true
            teamRating.enabled = true
            robotImage.userInteractionEnabled = true
            
            teamNotes.enabled = true
            saveTeam.enabled = true
            
            loadTeam()
        } else {
            resetView()
        }
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
            
            autoStackControl.value = 0
            canYellowBins.on = false
            canZoneChange.on = false
            canVisionTrack.on = false
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
            
            totesStackControl.value = 0
            canUpright.on = false
            canInverted.on = false
            canFlip.on = false
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
            
            litterStackControl.value = 0
            canLandfill.on = false
            canContainer.on = false
            canGround.on = false
        }
        
        if (hasContainers.selectedSegmentIndex == 0) {
            //Enable category
            containersStackControl.enabled = true
            containersStack.enabled = true
        } else {
            //Disable category
            containersStackControl.enabled = false
            containersStack.enabled = false
            
            containersStackControl.value = 0
        }
        
        updateStackLevels(self)
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
        var currentTeam:Team = Team(number: teamNumber.text.toInt()!)
        
        currentTeam.teamName = teamName.text
        
        if (hasAuto.selectedSegmentIndex == 0) {
            currentTeam.hasAuto = true
        } else {
            currentTeam.hasAuto = false
        }
        
        if (hasTotes.selectedSegmentIndex == 0) {
            currentTeam.hasTotes = true
        } else {
            currentTeam.hasTotes = false
        }
        
        if (hasContainers.selectedSegmentIndex == 0) {
            currentTeam.hasContainers = true
        } else {
            currentTeam.hasContainers = false
        }
        
        if (hasLitter.selectedSegmentIndex == 0) {
            currentTeam.hasLitter = true
        } else {
            currentTeam.hasLitter = false
        }
        
        currentTeam.driveStyle = driveStyle.selectedSegmentIndex
        
        currentTeam.autoStack = Int(autoStackControl.value)
        currentTeam.canYellowBins = canYellowBins.on
        currentTeam.canZoneChange = canZoneChange.on
        currentTeam.canVisionTrack = canVisionTrack.on
        
        currentTeam.totesStack = Int(totesStackControl.value)
        currentTeam.canUpright = canUpright.on
        currentTeam.canInverted = canInverted.on
        currentTeam.canFlip = canFlip.on
        
        currentTeam.litterStack = Int(litterStackControl.value)
        currentTeam.canLandfill = canLandfill.on
        currentTeam.canContainer = canContainer.on
        currentTeam.canGround = canGround.on
        
        currentTeam.containersStack = Int(containersStackControl.value)
        
        currentTeam.teamRating = teamRating.selectedSegmentIndex
        
        currentTeam.save()
        resetView()
    }
    
    @IBAction func captureImage(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            println("Button capture")
            
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        
        robotImage.image = image
        
        File.writeImage("\(teamNumber.text).png", content: image)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "teamNotes" {
            let controller = (segue.destinationViewController as UINavigationController).topViewController as TeamNotes
            controller.teamNumber = teamNumber.text.toInt()!
        }
    }

}
