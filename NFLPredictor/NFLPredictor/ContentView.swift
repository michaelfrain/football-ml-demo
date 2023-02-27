//
//  ContentView.swift
//  NFLPredictor
//
//  Created by Michael Frain on 2/21/23.
//  Copyright © 2023 Michael Frain. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var presentingModal = false
    @State var prediction: Double = 0
    
    @State private var homeTeam: Team = Team.defaultList[0]
    @State private var visitingTeam: Team = Team.defaultList[0]
    @State private var yppDiff: String = ""
    @State private var turnoverDiff: String = ""
    @State private var firstDownDiff: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Picker("Select a home team", selection: $homeTeam) {
                    ForEach(Team.defaultList, id: \.self) {
                        Text($0.teamName)
                    }
                }
                .padding()
                Picker("Select a visiting team", selection: $visitingTeam) {
                    ForEach(Team.defaultList, id: \.self) {
                        Text($0.teamName)
                    }
                }
                .padding()
            }
            VStack {
                TextField("Yardage per play differential", text: $yppDiff)
                TextField("Turnover differential", text: $turnoverDiff)
                TextField("First down differential", text: $firstDownDiff)
                Button("Predict!") {
                    let predictor = Predictor(homeTeam: homeTeam, visitingTeam: visitingTeam, yppDiff: Double(yppDiff) ?? 0, turnoverDiff: Double(turnoverDiff) ?? 0, firstDownDiff: Double(firstDownDiff) ?? 0)
                    self.prediction = predictor.predictResult()
                    
                    self.presentingModal = true
                }
                .sheet(isPresented: $presentingModal) {
                    ResultView(homeTeam: self.homeTeam.teamName, visitingTeam: self.visitingTeam.teamName, prediction: self.prediction)
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
