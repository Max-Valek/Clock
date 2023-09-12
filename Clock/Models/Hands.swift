//
//  Hands.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI


enum ClockHandType: Int, CaseIterable {
    case hour
    case minute
    case second
    
    var lengthScale: CGFloat {
        switch self {
        case .hour: return 0.6
        default: return 0.8
        }
    }
    
    var widths: [CGFloat] {
        switch self {
        case .hour: return [3, 4, 8]
        case .minute: return [2, 2, 4]
        case .second: return [1, 1, 1]
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
