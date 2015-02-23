//
//  Team.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/17/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class Team: NSObject {
    var teamNumber: Int = 0
    var teamName: NSString = ""
    
    var robotImage:UIImage = UIImage(named: "M-Scout")!
    
    var hasAuto: Bool = false
    var hasTotes: Bool = false
    var hasContainers: Bool = false
    var hasLitter: Bool = false
    
    var driveStyle: Int = 0
    
    var autoStack: Int = 0
    var canYellowBins: Bool = false
    var canZoneChange: Bool = false
    var canVisionTrack: Bool = false
    
    var totesStack: Int = 0
    var canUpright: Bool = false
    var canInverted: Bool = false
    var canFlip: Bool = false
    
    var litterStack: Int = 0
    var canLandfill: Bool = false
    var canContainer: Bool = false
    var canGround: Bool = false
    
    var containersStack: Int = 0
    
    var teamRating: Int = 0
    
    var teamNotes:NSString = ""
    
    var filePath:NSString = ""
    var imagePath:NSString = ""
    
    var teamExists: Bool = false;
    
    init(number: Int = 0) {
        
        teamNumber = number;
        
        filePath = "\(teamNumber).json"
        imagePath = "\(teamNumber).png"
        
        if (File.exists(filePath)) {
            
            let json = JSON(JSONParseDictionary(File.read(filePath)!))
            
            //println(json.description)
            
            teamNumber = json["teamNumber"].intValue
            teamName = json["teamName"].stringValue
            
            if (File.exists("\(teamNumber).png")) {
                println("Image Exists")
                robotImage = File.readImage(imagePath)!
            } else {
                NSLog("No image at %@", imagePath)
            }
            
            hasAuto = json["hasAuto"].boolValue
            hasTotes = json["hasTotes"].boolValue
            hasContainers = json["hasContainers"].boolValue
            hasLitter = json["hasLitter"].boolValue
            
            driveStyle = json["driveStyle"].intValue
            
            autoStack = json["autoStack"].intValue
            canYellowBins = json["canYellowBins"].boolValue
            canZoneChange = json["canZoneChange"].boolValue
            canVisionTrack = json["canVisionTrack"].boolValue
            
            totesStack = json["totesStack"].intValue
            canUpright = json["canUpright"].boolValue
            canInverted = json["canInverted"].boolValue
            canFlip = json["canFlip"].boolValue
            
            litterStack = json["litterStack"].intValue
            canLandfill = json["canLandfill"].boolValue
            canContainer = json["canContainer"].boolValue
            canGround = json["canGround"].boolValue
            
            containersStack = json["containersStack"].intValue
            
            teamRating = json["teamRating"].intValue
            
            teamNotes = json["teamNotes"].stringValue
            
            teamExists = true;
            
            NSLog("Loaded %d %@", teamNumber, teamName)
            
        } else {
            NSLog("Team %d not located. New object created.", teamNumber)
        }
    }
    
    func save() {
        NSLog("Saving team %d...", teamNumber)
        //File.remove(filePath)
        let json = JSON(["teamNumber": teamNumber, "teamName": teamName, "hasAuto": hasAuto, "hasTotes": hasTotes, "hasContainers": hasContainers, "hasLitter": hasLitter, "driveStyle": driveStyle, "autoStack": autoStack, "canYellowBins": canYellowBins, "canZoneChange": canZoneChange, "canVisionTrack": canVisionTrack, "totesStack": totesStack, "canUpright": canUpright, "canInverted": canInverted, "canFlip": canFlip, "litterStack": litterStack, "canLandfill": canLandfill, "canContainer": canContainer, "canGround": canGround, "containersStack": containersStack, "teamRating": teamRating, "teamNotes": teamNotes])
        File.write(filePath, content: json.description, encoding: NSASCIIStringEncoding)
        
    }
    
    func diag() {
        
        //save();
        
        //File.remove(filePath)
        
        //NSLog("Team Number: %d", teamNumber)
        
    }
}
