//
//  LeaderboardView.swift
//  PetsLeaderboard
//
//  Created by Nowroz Islam on 14/9/24.
//

import SwiftData
import SwiftUI

struct LeaderboardView: View {
    @Query(sort: \Pet.numberOfVotes, order: .reverse) private var pets: [Pet]
    
    var totalNumberOfVotes: Int {
        pets.reduce(0) { $0 + $1.numberOfVotes }
    }
    
    var body: some View {
        Grid(alignment: .leading) {
            ForEach(pets) { pet in
                GridRow {
                    Text(pet.petName)
                    ProgressView(value: Double(pet.numberOfVotes), total: Double(totalNumberOfVotes))
                        .frame(maxWidth: .infinity)
                    Text(pet.numberOfVotes, format: .number)
                        .gridColumnAlignment(.trailing)
                }
                
                Divider()
                    .gridCellUnsizedAxes(.horizontal)
            }
        }
    }
}

#Preview(traits: .sampleData) {
    LeaderboardView()
}
