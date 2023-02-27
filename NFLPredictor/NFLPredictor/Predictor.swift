//
//  Predictor.swift
//  NFLPredictor
//
//  Created by Michael Frain on 2/26/23.
//  Copyright © 2023 Michael Frain. All rights reserved.
//

struct Predictor {
    var homeTeam: Team
    var visitingTeam: Team
    var yppDiff: Double
    var turnoverDiff: Double
    var firstDownDiff: Double
    
    var model: PredictorModel = PredictorModel()
    
    func predictResult() -> Double {
        let homeInput = PredictorModelInput(Team: homeTeam.teamName, YPP_Differential: yppDiff, Turnover_Differential: turnoverDiff, _1st_Down_Differential: firstDownDiff)
        guard let homeOutput = try? model.prediction(input: homeInput) else { return 0 }
        
        let visitorInput = PredictorModelInput(Team: visitingTeam.teamName, YPP_Differential: yppDiff * -1, Turnover_Differential: turnoverDiff * -1, _1st_Down_Differential: firstDownDiff * -1)
        guard let visitorOutput = try? model.prediction(input: visitorInput) else { return 0 }
        
        let adjustedhomeDiff = homeOutput.Point_Differential + 0.23
        let adjustedVisitorDiff = visitorOutput.Point_Differential - 0.23
        
        let prediction = (adjustedhomeDiff - adjustedVisitorDiff) / 2.0
            
        return prediction
    }
}
