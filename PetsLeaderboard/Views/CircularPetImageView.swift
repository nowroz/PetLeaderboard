//
//  CircularCatImageView.swift
//  PetsLeaderboard
//
//  Created by Nowroz Islam on 17/9/24.
//

import SwiftUI

struct CircularPetImageView: View {
    let petName: String
    
    var body: some View {
        Image(petName.lowercased())
            .resizable()
            .scaledToFill()
            .clipShape(.circle)
            .padding(5)
            .overlay {
                Circle()
                    .stroke(.gray, lineWidth: 4)
            }
    }
}

#Preview {
    CircularPetImageView(petName: "Cat")
}
