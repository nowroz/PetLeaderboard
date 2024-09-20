//
//  Rank.swift
//  PetsLeaderboard
//
//  Created by Nowroz Islam on 18/9/24.
//

import Foundation
import SwiftUI

struct Rank: LayoutValueKey {
    static let defaultValue: Int = 1
}

extension View {
    func rank(_ value: Int) -> some View {
        layoutValue(key: Rank.self, value: value)
    }
}
