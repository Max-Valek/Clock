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
    
    let hourColor: Color
    let minuteColor: Color
    let secondColor: Color
    
    init(hands: [ClockHandType],
         indicatorMode: IndicatorMode,
         hourColor: Color,
         minuteColor: Color,
         secondColor: Color
    ) {
        self.time = ClockTime(date: Date())
        self.hands = hands
        self.indicatorMode = indicatorMode
        self.hourColor = hourColor
        self.minuteColor = minuteColor
        self.secondColor = secondColor
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


