//
//  HourIndicatorsViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

extension HourIndicators {
    
    /// View model class for the indicators around the clock.
    final class ViewModel: ClockObserver {

        let indicators: Indicators      /// Logic for indicators based on mode selected.
        let indicatorCount: Int         /// Number of indicators (60 for hours only to simplify calculations)
        
        override init(clockManager: ClockManager) {
            self.indicators = Indicators(mode: clockManager.clock.indicatorMode)
            self.indicatorCount = self.indicators.count
            super.init(clockManager: clockManager)
        }
        
        /// Start indicator path at the top center point.
        var topCenter: CGPoint { CGPoint(x: radius, y: 0) }
        
        /// Point that is the indicator's length down from top center.
        func indicatorEnd(for index: Int) -> CGPoint {
            CGPoint(x: radius, y: height(for: index) * self.size.height)
        }
        
        /// Calculate the indicator's width based on its index.
        func width(for index: Int) -> CGFloat { indicators.width(for: index) }
        
        /// Calculate the indicator's height based on its index.
        func height(for index: Int) -> CGFloat { size.width * indicators.height(for: index) }
        
        /// Calculate the indicator's rotation angle based on its index.
        func rotation(for index: Int) -> Angle { indicators.rotation(for: index) }
        
        /// Calculate the indicator's color based on its index.
        func color(for index: Int) -> Color {
            if isCurrentSecond(index) { return clock.colors.seconds }
            if isCurrentMinute(index) { return clock.colors.minutes }
            return clock.colors.hours.opacity(indicators.isHour(index) ? 0.5 : 0.25)
        }
        
        /// True if the current time's seconds is equal to the index.
        private func isCurrentSecond(_ index: Int) -> Bool { time.seconds == index }
        
        /// True if the current time's minutes is equal to the index.
        private func isCurrentMinute(_ index: Int) -> Bool { time.minutes == index }
    }
}

