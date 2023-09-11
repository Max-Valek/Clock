//
//  Hands.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

struct ClockHandConfiguration {
    let lengthScale: CGFloat
    let thickness: CGFloat
}

enum ClockHandType: Int, CaseIterable {
    case hour
    case minute
    case second
    
    static var thicknessScale: CGFloat = 0.015
    
    var lengthScale: CGFloat {
        switch self {
        case .hour: return 0.65
        default: return 0.85
        }
    }
    
    var largeThicknessScale: CGFloat {
        switch self {
        case .hour: return 6
        case .minute: return 3
        case .second: return 1
        }
    }
    
    var mediumThicknessScale: CGFloat {
        switch self {
        case .hour: return 4
        case .minute: return 2
        case .second: return 1
        }
    }
    
    var smallThicknessScale: CGFloat {
        switch self {
        case .hour: return 3
        case .minute: return 2
        case .second: return 1
        }
    }
    
    var configuration: ClockHandConfiguration {
        switch self {
        case .hour:
            return ClockHandConfiguration(lengthScale: 0.65, thickness: 4)
        case .minute:
            return ClockHandConfiguration(lengthScale: 0.85, thickness: 2)
        case .second:
            return ClockHandConfiguration(lengthScale: 0.85, thickness: 1)
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
