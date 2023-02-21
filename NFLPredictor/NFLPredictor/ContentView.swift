//
//  ContentView.swift
//  NFLPredictor
//
//  Created by Michael Frain on 2/21/23.
//  Copyright © 2023 Michael Frain. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var yppDiff: String = ""
    @State private var turnoverDiff: String = ""
    @State private var firstDownDiff: String = ""
    var body: some View {
        VStack {
            HStack {
                Button("Home Team") {
                    
                }
                .padding()
                Button("Visiting Team") {
                    
                }
                .padding()
            }
            VStack {
                TextField("Yardage per play differential", text: $yppDiff)
                TextField("Turnover differential", text: $turnoverDiff)
                TextField("First down differential", text: $firstDownDiff)
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
