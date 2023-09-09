//
//  HandType.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

protocol ScalablePointer: Hashable {
    
    var color: Color { get }
    var thickness: CGFloat { get }
    var lengthMultiplier: CGFloat { get }
    func rotationAngle(for time: Clock) -> Angle
}

/// Represents each hand on the clock.
enum ClockHand: ScalablePointer, CaseIterable {
    
    case hour, minute, second
    
    var color: Color {
        switch self {
        case .hour: return .primary
        case .minute: return .secondary
        case .second: return .red
        }
    }

    /// Thickness of the different hands.
    var thickness: CGFloat {
        switch self {
        case .hour: return 10
        case .second: return 2
        case .minute: return 5
        }
    }
    
    /// Percentage of the clock radius the hand will span (from center of clock to end).
    var lengthMultiplier: CGFloat {
        switch self {
        case .hour: return 0.6
        case .minute: return 0.8
        case .second: return 0.8
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
