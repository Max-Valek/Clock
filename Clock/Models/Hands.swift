//
//  Hands.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

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
            return ClockHandConfiguration(color: .primary, lengthScale: 0.65, thickness: 8)
        case .minute:
            return ClockHandConfiguration(color: .primary, lengthScale: 0.85, thickness: 4)
        case .second:
            return ClockHandConfiguration(color: .red, lengthScale: 0.85, thickness: 2)
        }
    }
    
    func rotation(for time: ClockTime) -> Angle {
        switch self {
        case .hour: return Angle(degrees: (360 / 12) * (Double(time.hours) + Double(time.minutes) / 60))
        case .minute: return Angle(degrees: Double(time.minutes) * 360 / 60)
        case .second: return Angle(degrees: Double(time.seconds) * 360 / 60)
        }
    }
}
