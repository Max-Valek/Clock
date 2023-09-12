//
//  ClockTime.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

struct Clock {
    let time: ClockTime
    let hands: [ClockHandType]
    let indicatorMode: IndicatorMode
    let colors: ClockColors
    
    init(hands: [ClockHandType],
         indicatorMode: IndicatorMode,
         colors: ClockColors
    ) {
        self.time = ClockTime(date: Date())
        self.hands = hands
        self.indicatorMode = indicatorMode
        self.colors = colors
    }
}

/// Represents the current time for the clock.
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

struct ClockColors {
    let hours: Color
    let minutes: Color
    let seconds: Color
}
