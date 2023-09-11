//
//  HourIndicatorsViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

extension HourIndicators {
    
    final class ViewModel: ClockObserver {

        //@Published var size: CGSize = .zero
        //let clock: Clock
        let indicators: Indicators
        let indicatorCount: Int
        
        override init(clockManager: ClockManager) {
           // self.clock = clockManager.clock
            self.indicators = Indicators(mode: clockManager.clock.indicatorMode)
            self.indicatorCount = self.indicators.count
            super.init(clockManager: clockManager)
        }
        
        var topCenter: CGPoint { CGPoint(x: self.size.width / 2, y: 0) }
        
        func indicatorEnd(for index: Int) -> CGPoint {
            CGPoint(
                x: self.size.width / 2,
                y: height(for: index) * self.size.height
            )
        }
        
        func width(for index: Int) -> CGFloat { indicators.width(for: index) }
        
        func height(for index: Int) -> CGFloat { size.width * indicators.height(for: index) }
        
        func rotation(for index: Int) -> Angle { indicators.rotation(for: index) }
        
        func color(for index: Int) -> Color {
            if isCurrentSecond(index) { return clock.secondColor }
            if isCurrentMinute(index) { return clock.minuteColor }
            return clock.hourColor.opacity(indicators.isHour(index) ? 0.5 : 0.25)
        }
        
        private func isCurrentSecond(_ index: Int) -> Bool {
            time.seconds == index
        }
        
        private func isCurrentMinute(_ index: Int) -> Bool {
            time.minutes == index
        }
    }
}

