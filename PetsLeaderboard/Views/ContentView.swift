//
//  ContentView.swift
//  PetsLeaderboard
//
//  Created by Nowroz Islam on 19/9/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                PetsRadialRankingView()
                    .frame(maxHeight: 300)
                
                LeaderboardView()
                
                VotingButtonsView()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Pets Leaderboard")
        }
    }
}

#Preview(traits: .sampleData) {
    ContentView()
}
