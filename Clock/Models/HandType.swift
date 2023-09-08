//
//  HandType.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

// Represents each hand on the clock.
enum HandType {
    
    case hour, minute, second
    
    /// Fill gradient for the hand.
    var gradient: LinearGradient {
        switch self {
        case .hour: return Metallic.silver.linearGradient
        case .minute: return Metallic.silver.linearGradient
        case .second: return LinearGradient(colors: [.red], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }

    /// Thickness of the different hands.
    var thickness: CGFloat {
        switch self {
        case .hour: return 6
        case .second: return 2
        case .minute: return 4
        }
    }
    
    /// Percentage of the clock radius the hand will span (from center of clock to end).
    var lengthMultiplier: CGFloat {
        switch self {
        case .hour: return 0.65
        case .minute: return 0.75
        case .second: return 0.75
        }
    }
    
    /// Angle to rotate the hand based on time.
    func rotationAngle(for time: Clock) -> Angle {
        switch self {
        case .hour: return Angle(degrees: (360 / 12) * (Double(time.hours) + Double(time.minutes) / 60))
        case .minute: return Angle(degrees: Double(time.minutes) * 360 / 60)
        case .second: return Angle(degrees: Double(time.seconds) * 360 / 60)
        }
    }
}
