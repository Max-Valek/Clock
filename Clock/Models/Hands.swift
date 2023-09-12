//
//  Hands.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// Represents the three hands on the clock.
enum ClockHandType: Int, CaseIterable {
    case hour, minute, second
    
    /// Percentage of the clock radius the hand spans.
    var lengthScale: CGFloat {
        switch self {
        case .hour: return 0.6
        default: return 0.8
        }
    }
    
    /// Variable width based on size mode.
    var widths: [CGFloat] {
        switch self {
        case .hour: return [4, 6, 9]
        case .minute: return [2, 3, 4]
        case .second: return [1, 1, 1]
        }
    }
    
    var gradientOpacity: Double {
        switch self {
        case .hour: return 0.15
        case .minute: return 0.15
        case .second: return 0.15
        }
    }
    
    /// Returns the type's width for the associated clock size.
    func width(forSize size: ClockSize) -> CGFloat {
        switch size {
        case .small: return widths[0]
        case .medium: return widths[1]
        case .large: return widths[2]
        }
    }
    
    /// Calculate the rotation angle based on the time.
    func rotation(for time: ClockTime) -> Angle {
        switch self {
        case .hour: return Angle(degrees: (360 / 12) * (Double(time.hours) + Double(time.minutes) / 60))
        case .minute: return Angle(degrees: Double(time.minutes) * 360 / 60)
        case .second: return Angle(degrees: Double(time.seconds) * 360 / 60)
        }
    }
}
