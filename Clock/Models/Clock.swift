//
//  Clock.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import Foundation

struct Clock {
    let hours: Int
    let minutes: Int
    let seconds: Int
    
    init(date: Date) {
        let now = Date()
        let calendar = Calendar.current
        let hours = calendar.component(.hour, from: now)
        self.hours = hours <= 12 ? hours : hours - 12
        minutes = calendar.component(.minute, from: now)
        seconds = calendar.component(.second, from: now)
    }
}
