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

        let hourScale: CGFloat = 0.05
        let minuteScale: CGFloat = 0.025
        
        override init(clockManager: ClockManager) {
            super.init(clockManager: clockManager)
        }
        
        /// Top center point in the frame.
        var topCenter: CGPoint {
            CGPoint(x: self.size.width / 2, y: 0)
        }
        
        /// Indicator length down from topCenter.
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
            isHourIndicator(minute) ? hourScale : minuteScale
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

//        func gradient(for hour: Int) -> LinearGradient {
//            return LinearGradient(
//                colors: [color(for: hour)],
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
//        }
//
//        func width(for hour: Int) -> CGFloat {
//            shouldHighlight(hour) ? 2 : 1
//        }
//
//        func rotation(for hour: Int) -> Angle {
//            Angle(degrees: Double(hour) * 360 / 12)
//        }
//
//        private func color(for hour: Int) -> Color {
//            if highlightSeconds(hour) { return HandType.second.color }
//            if highlightHours(hour) { return HandType.hour.color }
//            if highlightMinutes(hour) { return HandType.minute.color }
//            return .gray
//        }
//
//        private func shouldHighlight(_ hour: Int) -> Bool {
//            highlightSeconds(hour) || highlightMinutes(hour) || highlightHours(hour)
//        }
//
//        private func highlightSeconds(_ hour: Int) -> Bool {
//            time.seconds % 5 == 0 && time.seconds / 5 == hour
//        }
//
//        private func highlightMinutes(_ hour: Int) -> Bool {
//            time.minutes / 5 >= hour && time.minutes / 5 < hour + 1
//        }
//
//        private func highlightHours(_ hour: Int) -> Bool {
//            time.hours >= hour && time.hours < hour + 1
//        }
    }
}

