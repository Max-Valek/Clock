//
//  HandView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// View representing a hand on the clock, rotated based on time.
struct HandView: View {
    
    let type: HandType
    let time: Clock
    
    @State private var clockSize: CGSize = .zero
    
    var body: some View {
        GeometryReader { proxy in
            RoundedRectangle(cornerRadius: 4)
                .fill(self.type.gradient)
                .frame(width: self.type.thickness, height: totalLength())
                .position(startingPoint())
                .rotationEffect(self.type.rotationAngle(for: self.time))
                .onAppear { self.clockSize = proxy.size }
//                .overlay(
//                    Circle().frame(width: 20).position(x: proxy.size.width / 2, y: proxy.size.height / 2)
//                )
        }
    }
    
    /// Starting point for the hand. Center of the clock offset by amount to overlap.
    private func startingPoint() -> CGPoint {
        let center = CGPoint(x: clockSize.width / 2, y: clockSize.height / 2)
        return CGPoint(x: center.x, y: center.y - overlapAmount())
    }

    /// Length of hand with added amount for overlap.
    private func totalLength() -> CGFloat {
        let fromCenter = lengthFromCenter()
        let overlapAmount = overlapAmount()
        return fromCenter + overlapAmount
    }
    
    private func overlapAmount() -> CGFloat {
        lengthFromCenter() / 4
    }
    
    /// Length of hand from center of the clock.
    private func lengthFromCenter() -> CGFloat {
        let radius = min(clockSize.width, clockSize.height) / 2
        return self.type.lengthMultiplier * radius
    }
}

struct HandView_Previews: PreviewProvider {
    static var previews: some View {
        HandView(type: .hour, time: .init(date: .now))
            .preferredColorScheme(.dark)
    }
}
