//
//  Teams.swift
//  NFLPredictor
//
//  Created by Michael Frain on 2/26/23.
//  Copyright © 2023 Michael Frain. All rights reserved.
//

import Foundation

struct Team: Identifiable {
    var id = UUID()
    var teamName: String
    
    static var defaultList: [Team] = {
        var teams: [Team] = []
        
        let teamNames = ["Arizona Cardinals", "Atlanta Falcons", "Baltimore Ravens", "Buffalo Bills", "Carolina Panthers", "Chicago Bears", "Cincinnati Bengals", "Cleveland Browns", "Dallas Cowboys", "Denver Broncos", "Detroit Lions", "Green Bay Packers", "Houston Texans", "Indianapolis Colts", "Jacksonville Jaguars", "Kansas City Chiefs", "Las Vegas Raiders", "Los Angeles Chargers", "Los Angeles Rams", "Miami Dolphins", "Minnesota Vikings", "New England Patriots", "New Orleans Saints", "New York Giants", "New York Jets", "Philadelphia Eagles", "Pittsburgh Steelers", "San Francisco 49ers", "Seattle Seahawks", "Tampa Bay Buccaneers", "Washington Commanders"]
        for team in teamNames {
            let teamStruct = Team(teamName: team)
            teams.append(teamStruct)
        }
        
        return teams
    }()
}

extension Team: Hashable {
    
}
