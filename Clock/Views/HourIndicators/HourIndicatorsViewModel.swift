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

        @Published var size: CGSize = .zero
        
        let indicatorMode: IndicatorMode
        
        init(mode: IndicatorMode, clockManager: ClockManager) {
            self.indicatorMode = mode
            super.init(clockManager: clockManager)
        }
        
        var topCenter: CGPoint {
            CGPoint(x: self.size.width / 2, y: 0)
        }
        
        func indicatorEnd(for minute: Int) -> CGPoint {
            CGPoint(
                x: self.size.width / 2,
                y: height(for: minute) * self.size.height
            )
        }
        
        func gradient(for minute: Int) -> LinearGradient {
            return LinearGradient(
                colors: [color(for: minute)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
        
        func width(for minute: Int) -> CGFloat {
            isHourIndicator(minute) ? 2 : 1
        }
        
        func height(for minute: Int) -> CGFloat {
            isHourIndicator(minute) ? IndicatorMode.hourScale : IndicatorMode.minuteScale
        }
        
        func rotation(for minute: Int) -> Angle {
            Angle(degrees: Double(minute) * 360 / 60)
        }
        
        private func isHourIndicator(_ minute: Int) -> Bool {
            minute % 5 == 0
        }
        
        private func color(for minute: Int) -> Color {
            if highlightSeconds(minute) { return ClockHandType.second.configuration.color }
            if highlightHours(minute) { return ClockHandType.minute.configuration.color }
            if highlightMinutes(minute) { return ClockHandType.hour.configuration.color }
            return .gray
        }
        
        private func shouldHighlight(_ minute: Int) -> Bool {
            highlightSeconds(minute) || highlightMinutes(minute) || highlightHours(minute)
        }

        private func highlightSeconds(_ minute: Int) -> Bool {
            time.seconds == minute
        }

        private func highlightMinutes(_ minute: Int) -> Bool {
            time.minutes == minute
        }

        private func highlightHours(_ minute: Int) -> Bool {
            time.hours == minute
        }
    }
}

