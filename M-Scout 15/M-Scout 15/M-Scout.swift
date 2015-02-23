
//
//  M-Scout.swift
//  M-Scout 15
//
//  Created by Brendan Boyle on 2/17/15.
//  Copyright (c) 2015 FRC: Team 3926. All rights reserved.
//

import UIKit

class M_Scout: NSObject {
    
    struct teams {
        static var teamList = M_Scout.teams.getTeams();
        
        static func getTeams() -> NSArray {
            
            var teams: [Team] = []
            
            let fileManager = NSFileManager.defaultManager()
            let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
            let enumerator:NSDirectoryEnumerator = fileManager.enumeratorAtPath(documentsPath)!
            
            while let element = enumerator.nextObject() as? String {
                if element.hasSuffix("json") { // checks the extension
                    var fileNameArr = split(element) {$0 == "."}
                    var teamNumber: String = fileNameArr[0]
                    teams.append(Team(number: teamNumber.toInt()!))
                }
            }
            
            return teams
        }
        
        static func printTeams() {
            for team in M_Scout.teams.teamList {
                let currentTeam = team as Team
                currentTeam.diag()
            }
        }
    }
}
