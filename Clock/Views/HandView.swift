//
//  HandView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// View representing a hand on the clock, rotated based on time.
struct HandView: View {
    
    let hand: HandType
    let time: Clock
    
    /// Percentage of the hand length to add as overlap.
    private let overlapMultiplier: CGFloat = 0.25
    
    @State private var size: CGSize = .zero
    
    var body: some View {
        GeometryReader { proxy in
            Capsule()
                .fill(self.hand.color)
                .frame(width: self.hand.thickness, height: totalLength())
                .position(startingPoint())
                .rotationEffect(self.hand.rotationAngle(for: self.time))
                .onAppear { self.size = proxy.size }
        }
    }
    
    /// Starting point for the hand. Center of the clock offset by amount to overlap.
    private func startingPoint() -> CGPoint {
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let mid = totalLength() / 2
        let amountToOffset = mid - overlapAmount()
        return CGPoint(x: center.x, y: center.y - amountToOffset)
    }

    /// Length of hand with added amount for overlap.
    private func totalLength() -> CGFloat {
        lengthFromCenter() + overlapAmount()
    }
    
    /// Amount to add past the center for overlapping.
    private func overlapAmount() -> CGFloat {
        lengthFromCenter() * overlapMultiplier
    }
    
    /// Length of hand from center of the clock.
    private func lengthFromCenter() -> CGFloat {
        let radius = min(size.width, size.height) / 2
        return self.hand.lengthMultiplier * radius
    }
}

struct HandView_Previews: PreviewProvider {
    static var previews: some View {
        HandView(hand: .hour, time: .init(date: .now))
    }
}
