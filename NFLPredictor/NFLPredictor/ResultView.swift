//
//  ResultView.swift
//  NFLPredictor
//
//  Created by Michael Frain on 2/27/23.
//  Copyright © 2023 Michael Frain. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    var homeTeam: String
    var visitingTeam: String
    var prediction: Double
    
    var body: some View {
        Text("Home Team: \(homeTeam)")
        Text("Visiting Team: \(visitingTeam)")
        Text("Predicted point differential (positive is home win, negative is visitor win): \(prediction)")
    }
}
