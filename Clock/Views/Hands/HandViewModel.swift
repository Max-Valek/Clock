//
//  HandViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

class HandViewModel: ClockObserver {
    
    @Published var size: CGSize = .zero
    
    let type: ClockHand
    
    let overlapMultiplier: CGFloat = 0.25       /// Percentage of the hand length to add as overlap.
    
    init(type: ClockHand, clockManager: ClockManager) {
        self.type = type
        super.init(clockManager: clockManager)
    }
    
    /// Starting point for the hand. Center of the clock offset by amount to overlap.
    func startingPoint() -> CGPoint {
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let mid = totalLength() / 2
        let amountToOffset = mid - overlapAmount()
        return CGPoint(x: center.x, y: center.y - amountToOffset)
    }

    /// Length of hand with added amount for overlap.
    func totalLength() -> CGFloat {
        lengthFromCenter() + overlapAmount()
    }
    
    /// Amount to add past the center for overlapping.
    func overlapAmount() -> CGFloat {
        lengthFromCenter() * overlapMultiplier
    }
    
    /// Length of hand from center of the clock.
    func lengthFromCenter() -> CGFloat {
        let radius = min(size.width, size.height) / 2
        return self.type.lengthMultiplier * radius
    }
}
