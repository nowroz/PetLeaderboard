//
//  VotingButtonsView.swift
//  PetsLeaderboard
//
//  Created by Nowroz Islam on 14/9/24.
//

import SwiftData
import SwiftUI

struct VotingButtonsView: View {
    @Query(sort: \Pet.petName) private var pets: [Pet]
    
    var body: some View {
        ViewThatFits {
            EqualWidthHStackLayout {
                buttons
            }
            
            EqualWidthVStackLayout {
                buttons
            }
        }
    }
    
    private var buttons: some View {
        ForEach(pets) { pet in
            Button {
                withAnimation(.smooth) {
                    pet.numberOfVotes += 1
                }
            } label: {
                Text(pet.petName)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
    }
}

#Preview(traits: .sampleData) {
    VotingButtonsView()
}
