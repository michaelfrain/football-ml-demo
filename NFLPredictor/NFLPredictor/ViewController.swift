//
//  ViewController.swift
//  NFLPredictor
//
//  Created by Michael Frain on 2/14/19.
//  Copyright © 2019 Michael Frain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var visitingTeamLabel: UILabel!
    @IBOutlet var homeTeamLabel: UILabel!
    
    @IBOutlet var visitingTeamPoints: UITextField!
    @IBOutlet var visitingTeamYards: UITextField!
    @IBOutlet var visitingTeamTurnovers: UITextField!
    
    @IBOutlet var homeTeamPoints: UITextField!
    @IBOutlet var homeTeamYards: UITextField!
    @IBOutlet var homeTeamTurnovers: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        predictHomeScore(sender: nil)
        predictHomeTeam(sender: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func predictHomeScore(sender: UIButton?) {
        let model = ScoreRegressor()
        
        guard let scoreOutput = try? model.prediction(Visitor: "New England Patriots", Home: "Los Angeles Rams", PtsV: 13.0, YdsV: 407.0, TOV: 1.0, YdsH: 260.0, TOH: 1.0) else {
            fatalError()
        }
        print(scoreOutput.PtsH)
    }
    
    @IBAction func predictHomeTeam(sender: UIButton?) {
        let model = TeamClassifier()
        
        guard let teamOutput = try? model.prediction(Visitor: "New England Patriots", PtsV: 13.0, PtsH: 3.0, YdsV: 407.0, TOV: 1.0, YdsH: 260.0, TOH: 1.0) else {
            fatalError()
        }
        print(teamOutput.Home)
        print(teamOutput.HomeProbability)
    }
}

