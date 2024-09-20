//
//  Pet.swift
//  PetsLeaderboard
//
//  Created by Nowroz Islam on 13/9/24.
//

import Foundation
import SwiftData

@Model final class Pet {
    @Attribute(.unique) var petName: String
    var numberOfVotes: Int
    
    init(petName: String, numberOfVotes: Int = 0) {
        self.petName = petName
        self.numberOfVotes = numberOfVotes
    }
}


extension Pet {
    static let pets: [Pet] = [
        Pet(petName: "Cat"),
        Pet(petName: "Dog"),
        Pet(petName: "Goldfish")
    ]
}
