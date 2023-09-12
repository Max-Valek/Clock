//
//  ClockHandsViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

extension HandView {
    
    /// View model class for an individual hand on the clock.
    final class ViewModel: ClockObserver {

        let type: ClockHandType         /// hour, minute, or second hand

        init(type: ClockHandType, clockManager: ClockManager) {
            self.type = type
            super.init(clockManager: clockManager)
        }
        
        /// Color associated with the hand.
        var color: Color { clock.handColor(for: type) }
        
        /// The hand's width based on the size mode.
        var thickness: CGFloat { type.width(forSize: sizeMode) }
        
        /// The hand's length based on the view radius.
        var length: CGFloat { type.lengthScale * radius }

        /// Anchor the end of the hand in the center of the view.
        var anchorPoint: CGPoint { return CGPoint(x: radius, y: radius - (length / 2)) }
        
        /// Calculate the hand's rotation based on the time.
        var rotation: Angle { type.rotation(for: time) }
    }
}
