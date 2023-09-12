//
//  ProgressGradientViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/12/23.
//

import SwiftUI

extension ProgressGradient {
    
    /// View model class for an individual hand on the clock.
    final class ViewModel: ClockObserver {

        let type: HandType         /// hour, minute, or second hand

        init(type: HandType, clockManager: ClockManager) {
            self.type = type
            super.init(clockManager: clockManager)
        }
        
        /// Start the progress gradient at the top (12 o'clock).
        var startAngle: Angle { .degrees(0) }
        
        /// Calculate the gradient color based on the hand.
        var gradientColors: [Color] { [.clear, clock.handColor(for: type)] }
        
        /// Calculate the gradient opacity based on the hand.
        var gradientOpacity: Double { type.gradientOpacity }

        /// Calculate the hand's rotation based on the time.
        var rotation: Angle { type.rotation(for: time) }
    }
}
