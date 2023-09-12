//
//  ClockHandsViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

extension ClockHands {
    
    /// View model class for hands on the clock.
    final class ViewModel: ClockObserver {

        @Published var hands: [ClockHandType] = []      /// Desired hands to show.

        override init(clockManager: ClockManager) {
            self.hands = Array(Set(clockManager.clock.hands))
            super.init(clockManager: clockManager)
        }

        /// Color for hands' anchor (center point).
        var anchorColor: Color { clock.colors.hours }
        
        /// Width for hands' anchor (center point).
        var anchorWidth: CGFloat { ClockHandType.hour.width(forSize: sizeMode) * 2 }
        
        /// Calculate a hand's rotation angle for ending the progress gradient.
        func rotation(hand: ClockHandType) -> Angle {
            guard hands.contains(hand) else { return .degrees(0) }
            return hand.rotation(for: time)
        }
    }
}
