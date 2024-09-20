//
//  PetsRadialRankingView.swift
//  PetsLeaderboard
//
//  Created by Nowroz Islam on 17/9/24.
//

import SwiftData
import SwiftUI

struct PetsRadialRankingView: View {
    @Query(sort: \Pet.numberOfVotes, order: .reverse) private var pets: [Pet]
    
    private var isThreeWayTie: Bool {
        pets[0].numberOfVotes == pets[1].numberOfVotes && pets[0].numberOfVotes == pets[2].numberOfVotes
    }
    
    private var layout: AnyLayout {
        if isThreeWayTie {
            AnyLayout(HStackLayout())
        } else {
            AnyLayout(RadialRankingLayout())
        }
    }
    
    var body: some View {
        layout {
            ForEach(pets) { pet in
                CircularPetImageView(petName: pet.petName)
                    .frame(width: 100, height: 100)
                    .rank(pet.numberOfVotes)
            }
        }
        .padding()
    }
}

#Preview(traits: .sampleData) {
    PetsRadialRankingView()
}
