//
//  Clock.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import Foundation

/// Represents the current time for the clock.
struct Clock {
    
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
