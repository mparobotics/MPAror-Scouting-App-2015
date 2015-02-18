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
    
    init(number: Int = 0) {
        teamNumber = number;
    }
    
    func diag() {
        println(teamNumber);
    }
}
