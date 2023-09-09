//
//  ClockHandViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

extension ClockHand {
    
    final class ViewModel: ClockObserver {
        
        @Published var size: CGSize = .zero
        
        let type: HandType
        //let overlapMultiplier: CGFloat = 0.15       /// Percentage of the hand length to add as overlap.
        
        init(type: HandType, clockManager: ClockManager) {
            self.type = type
            super.init(clockManager: clockManager)
        }
        
        /// Hand length from its scale factor and the additional amount (on other side of anchor) for overlap.
        var length: CGFloat {
//            lengthFromCenter() + overlapAmount()
            let radius = min(size.width, size.height) / 2
            return self.type.lengthMultiplier * radius
        }
        
        /// Point to rotate around.
        var anchorPoint: CGPoint {
            let center = CGPoint(x: size.width / 2, y: size.height / 2)
//            let middle = length / 2
//            let amountToOffset = middle - overlapAmount()
            return CGPoint(x: center.x, y: center.y - (length / 2))
        }
        
        /// Rotation angle based on hand type and time.
        var rotation: Angle {
            type.rotationAngle(for: time)
        }
        
        /// Amount to add past the center for overlapping.
        private func overlapAmount() -> CGFloat {
            //lengthFromCenter() * overlapMultiplier
            0
        }
        
        /// Length of hand from center of the clock.
        private func lengthFromCenter() -> CGFloat {
            let radius = min(size.width, size.height) / 2
            return self.type.lengthMultiplier * radius
        }
    }
}
