//
//  PetsLeaderboardApp.swift
//  PetsLeaderboard
//
//  Created by Nowroz Islam on 13/9/24.
//

import SwiftData
import SwiftUI

@main
struct PetsLeaderboardApp: App {
    let modelContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: false)
            let modelContainer: ModelContainer = try ModelContainer(for: Pet.self, configurations: config)
            
            if try modelContainer.mainContext.fetch(FetchDescriptor<Pet>()).isEmpty {
                Pet.pets.forEach { modelContainer.mainContext.insert($0) }
            }
            
            return modelContainer
        } catch {
            fatalError("Failed to create model container: \(error.localizedDescription).")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }
}
