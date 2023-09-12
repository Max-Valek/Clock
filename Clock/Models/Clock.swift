//
//  ClockTime.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// Data model representing a customizable clock.
struct Clock {
    let time: ClockTime                     /// Hours, minutes, seconds
    let hands: [ClockHandType]              /// Desired hands to include
    let indicatorMode: IndicatorMode        /// Desired indicators to show
    let colors: ClockColors                 /// Desired clock colors
    
    init(hands: [ClockHandType],
         indicatorMode: IndicatorMode,
         colors: ClockColors
    ) {
        self.time = ClockTime(date: Date())
        self.hands = hands
        self.indicatorMode = indicatorMode
        self.colors = colors
    }
    
    func handColor(for hand: ClockHandType) -> Color {
        switch hand {
        case .hour: return colors.hours
        case .minute: return colors.minutes
        case .second: return colors.seconds
        }
    }
}

/// Time for the clock. (hours, minutes, seconds).
struct ClockTime {
    let hours: Int
    let minutes: Int
    let seconds: Int
    
    init(date: Date) {
        let hoursIn24 = Calendar.current.component(.hour, from: .now)
        hours = hoursIn24 <= 12 ? hoursIn24 : hoursIn24 - 12
        minutes = Calendar.current.component(.minute, from: .now)
        seconds = Calendar.current.component(.second, from: .now)
    }
}

/// Colors for the clock.
struct ClockColors {
    let hours: Color
    let minutes: Color
    let seconds: Color
}
