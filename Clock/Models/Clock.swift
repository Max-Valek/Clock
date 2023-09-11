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
    let primaryColor: Color
    let secondaryColor: Color
    
    init(hands: [ClockHandType],
         indicatorMode: IndicatorMode,
         primaryColor: Color,
         secondaryColor: Color
    ) {
        self.time = ClockTime(date: Date())
        self.hands = hands
        self.indicatorMode = indicatorMode
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
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

enum IndicatorMode {
    case all, hoursOnly, none
    
    static let hourScale: CGFloat = 0.05
    static let minuteScale: CGFloat = 0.025
}

struct Indicators {
    let mode: IndicatorMode
    static let hourScale: CGFloat = 0.05
    static let minuteScale: CGFloat = 0.025
    
    init(mode: IndicatorMode) {
        self.mode = mode
    }
    
    var count: Int { mode == .none ? 0 : 60 }
    
    func isHour(_ index: Int) -> Bool { mode == .none ? false : index % 5 == 0 }
    
    func width(for index: Int) -> CGFloat {
        guard mode != .none else { return 0 }
        if mode == .hoursOnly && !isHour(index) { return 0 }
        return isHour(index) ? 3 : 2
    }
    
    func height(for index: Int) -> CGFloat { isHour(index) ? Self.hourScale : Self.minuteScale }
    
    func rotation(for index: Int) -> Angle {
        Angle(degrees: mode == .none ? 0 : Double(index) * 360 / Double(count))
    }
}

struct ClockHandConfiguration {
    let color: Color
    let lengthScale: CGFloat
    let thickness: CGFloat
}

enum ClockHandType: Int, CaseIterable {
    case hour
    case minute
    case second

    var configuration: ClockHandConfiguration {
        switch self {
        case .hour:
            return ClockHandConfiguration(color: .primary, lengthScale: 0.65, thickness: 10)
        case .minute:
            return ClockHandConfiguration(color: .primary, lengthScale: 0.85, thickness: 5)
        case .second:
            return ClockHandConfiguration(color: .red, lengthScale: 0.85, thickness: 3)
        }
    }
    
    /*
     hour: 12 = 0
     360/12 = 30
     minutes = 30
     
     30 * (0 + 20 / 60) = 30 * (0 + 1/3) = 30 * 1 / 3 = 10
     */
    func rotation(for time: ClockTime) -> Angle {
        switch self {
        case .hour: return Angle(degrees: (360 / 12) * (Double(time.hours) + Double(time.minutes) / 60))
        case .minute: return Angle(degrees: Double(time.minutes) * 360 / 60)
        case .second: return Angle(degrees: Double(time.seconds) * 360 / 60)
        }
    }
}
