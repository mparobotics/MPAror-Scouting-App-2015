
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
        
        static func getTeams() -> NSMutableArray {
            
            let team1:Team = Team(number: 1234)
            let team2:Team = Team(number: 2345)
            let team3:Team = Team(number: 3456)
            
            return [team1, team2, team3] as NSMutableArray
        }
        
        static func printTeams() {
            for team in M_Scout.teams.teamList {
                let currentTeam = team as Team
                currentTeam.diag()
            }
        }
    }
}
