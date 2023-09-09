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
        let indicators: Indicators
        
        override init(clockManager: ClockManager) {
            self.indicators = Indicators(mode: clockManager.clock.indicatorMode)
            super.init(clockManager: clockManager)
        }
        
        var topCenter: CGPoint { CGPoint(x: self.size.width / 2, y: 0) }
        
        func indicatorEnd(for index: Int) -> CGPoint {
            CGPoint(
                x: self.size.width / 2,
                y: height(for: index) * self.size.height
            )
        }
        
        func width(for index: Int) -> CGFloat {
            indicators.width(for: index)
        }
        
        func height(for index: Int) -> CGFloat {
            indicators.height(for: index)
        }
        
        func rotation(for index: Int) -> Angle {
            indicators.rotation(for: index)
        }
        
        func color(for index: Int) -> Color {
            isCurrentSecond(index) ?
            ClockHandType.second.configuration.color :
            ( indicators.isHour(index) ? .primary : .gray )
        }
        
        private func isCurrentSecond(_ index: Int) -> Bool {
            time.seconds == index
        }
    }
}

//extension HourIndicators {
//
//    final class ViewModel: ClockObserver {
//
//        @Published var size: CGSize = .zero
//        let indicators: Indicators
//
//        init(mode: IndicatorMode, clockManager: ClockManager) {
//            self.indicators = Indicators(mode: mode)
//            super.init(clockManager: clockManager)
//        }
//
//        var topCenter: CGPoint { CGPoint(x: self.size.width / 2, y: 0) }
//
//        func indicatorEnd(for index: Int) -> CGPoint {
//            CGPoint(
//                x: self.size.width / 2,
//                y: height(for: index) * self.size.height
//            )
//        }
//
//        func width(for index: Int) -> CGFloat {
//            indicators.width(for: index)
//        }
//
//        func height(for index: Int) -> CGFloat {
//            indicators.height(for: index)
//        }
//
//        func rotation(for index: Int) -> Angle {
//            indicators.rotation(for: index)
//        }
//
//        func color(for index: Int) -> Color {
//            isCurrentSecond(index) ?
//            ClockHandType.second.configuration.color :
//            ( indicators.isHour(index) ? .primary : .gray )
//        }
//
//        private func isCurrentSecond(_ index: Int) -> Bool {
//            time.seconds == index
//        }
//    }
//}

