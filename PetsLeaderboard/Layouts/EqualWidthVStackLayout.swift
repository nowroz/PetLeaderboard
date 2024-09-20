//
//  EqualWidthVStackLayout.swift
//  PetsLeaderboard
//
//  Created by Nowroz Islam on 18/9/24.
//

import Foundation
import SwiftUI

struct EqualWidthVStackLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxIdealSize = maxIdealSize(subviews: subviews)
        let spacings = spacings(subviews: subviews)
        
        let totalSpacing = spacings.reduce(0) { $0 + $1 }
        let totalHeight = maxIdealSize.height * CGFloat(subviews.count) + totalSpacing
        
        return CGSize(width: maxIdealSize.width, height: totalHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let maxIdealSize = maxIdealSize(subviews: subviews)
        let spacings = spacings(subviews: subviews)
        
        var y = bounds.minY + maxIdealSize.height / 2
        
        for index in subviews.indices {
            subviews[index].place(at: CGPoint(x: bounds.midX, y: y), anchor: .center, proposal: ProposedViewSize(maxIdealSize))
            
            y += maxIdealSize.height + spacings[index]
        }
    }
    
    private func maxIdealSize(subviews: Subviews) -> CGSize {
        subviews.reduce(.zero) { size, subview in
            CGSize(width: max(size.width, subview.sizeThatFits(.unspecified).width), height: max(size.height, subview.sizeThatFits(.unspecified).height))
        }
    }
    
    private func spacings(subviews: Subviews) -> [CGFloat] {
        subviews.indices.map { index in
            guard index < subviews.count - 1 else { return 0 }
            
            return subviews[index].spacing.distance(to: subviews[index + 1].spacing, along: .vertical)
        }
    }
}
