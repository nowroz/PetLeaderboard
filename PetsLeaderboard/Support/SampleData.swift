//
//  SampleData.swift
//  PetsLeaderboard
//
//  Created by Nowroz Islam on 18/9/24.
//

import Foundation
import SwiftData
import SwiftUI
 
struct SampleData: PreviewModifier {
    typealias Context = ModelContainer
    
    static func makeSharedContext() async throws -> ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: Pet.self, configurations: config)
        
        if try modelContainer.mainContext.fetch(FetchDescriptor<Pet>()).isEmpty {
            Pet.pets.forEach { modelContainer.mainContext.insert($0) }
        }
        
        return modelContainer
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content
            .modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    static var sampleData: Self = .modifier(SampleData())
}
