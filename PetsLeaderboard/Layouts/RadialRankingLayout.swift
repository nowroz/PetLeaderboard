//
//  RadialRankingLayout.swift
//  PetsLeaderboard
//
//  Created by Nowroz Islam on 18/9/24.
//

import Foundation
import SwiftUI

struct RadialRankingLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let radius = min(bounds.width, bounds.height) / 3
        let baseRotationAngle = Angle(degrees: 360 / Double(subviews.count)).radians
        
        let ranks = subviews.map { subview in
            subview[Rank.self]
        }
        
        let offset = getOffset(ranks: ranks)
        
        for (index, subview) in subviews.enumerated() {
            var point = CGPoint(x: 0, y: -radius)
                .applying(CGAffineTransform(rotationAngle: baseRotationAngle * Double(index) + offset))
            
            point.x += bounds.midX
            point.y += bounds.midY
            
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
    
    private func getOffset(ranks: [Int]) -> Double {
        if ranks[0] == ranks[1] {
            -1
        } else if ranks[1] == ranks[2] {
            0
        } else {
            -0.5
        }
    }
}
