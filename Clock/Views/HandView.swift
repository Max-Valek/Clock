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
    
    var body: some View {
        GeometryReader { proxy in
            RoundedRectangle(cornerRadius: 4)
                .fill(self.type.gradient)
                .frame(width: self.type.thickness, height: totalLength(proxy))
                .position(startingPoint(proxy))
                .rotationEffect(self.type.rotationAngle(for: self.time))
        }
    }
    
    /// Starting point for the hand. Center of the clock offset by amount to overlap.
    private func startingPoint(_ proxy: GeometryProxy) -> CGPoint {
        let center = CGPoint(x: proxy.size.width / 2, y: (proxy.size.height / 2))
        return CGPoint(x: center.x, y: center.y - overlapAmount(proxy.size))
    }
    
    /// Length of hand with added amount for overlap.
    private func totalLength(_ proxy: GeometryProxy) -> CGFloat {
        let fromCenter = lengthFromCenter(proxy.size)
        let overlapAmount = overlapAmount(proxy.size)
        return fromCenter + overlapAmount
    }
    
    private func overlapAmount(_ size: CGSize) -> CGFloat {
        lengthFromCenter(size) / 4
    }
    
    /// Length of hand from center of the clock.
    private func lengthFromCenter(_ size: CGSize) -> CGFloat {
        let radius = min(size.width, size.height) / 2
        return self.type.lengthMultiplier * radius
    }
}

struct HandView_Previews: PreviewProvider {
    static var previews: some View {
        HandView(type: .hour, time: .init(date: .now))
            .preferredColorScheme(.dark)
    }
}
