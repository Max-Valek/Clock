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

struct Hands {
    let primaryColor: Color
    let secondaryColor: Color
    let types: [ClockHandType]
    
    init(
        primaryColor: Color = .primary,
        secondaryColor: Color = .red,
        types: [ClockHandType] = [.hour, .minute, .second]
    ) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.types = types
    }
}

///// Represents each hand on the clock.
//struct Hand: ScalableHand {
//    let type: Type
//    let color: Color
//    let thickness: CGFloat
//    let lengthMultiplier: CGFloat
//
//    enum `Type` {
//        case hour
//        case minute
//        case second
//    }
//
//    func rotationAngle(for time: ClockTime) -> Angle {
//        Angle(degrees: 0)
//    }
//
//    static func hour() -> Hand {
//        return Hand(type: .hour, color: .primary, thickness: 8, lengthMultiplier: 0.6)
//    }
//
//    static func minute() -> Hand {
//        return Hand(type: .minute, color: .primary, thickness: 4, lengthMultiplier: 0.85)
//    }
//
//    static func second() -> Hand {
//        return Hand(type: .second, color: .red, thickness: 1, lengthMultiplier: 0.85)
//    }
//}
//
///// Protocol for a resizable and rotatable clock hand.
//protocol ScalableHand: Hashable {
//    var color: Color { get }
//    var thickness: CGFloat { get }
//    var lengthMultiplier: CGFloat { get }
//    func rotationAngle(for time: ClockTime) -> Angle
//}
//
///// Represents each hand on the clock.
//enum HandType: ScalableHand, CaseIterable {
//    case hour, minute, second
//
//    var color: Color {
//        switch self {
//        case .hour: return .primary
//        case .minute: return .primary
//        case .second: return .red
//        }
//    }
//
//    /// Thickness of the different hands.
//    var thickness: CGFloat {
//        switch self {
//        case .hour: return 8
//        case .second: return 1
//        case .minute: return 4
//        }
//    }
//
//    /// Percentage of the clock radius the hand will span (from center of clock to end).
//    var lengthMultiplier: CGFloat {
//        switch self {
//        case .hour: return 0.6
//        case .minute: return 0.85
//        case .second: return 0.85
//        }
//    }
//
//    /// Angle to rotate the hand based on time.
//    func rotationAngle(for time: ClockTime) -> Angle {
//        switch self {
//        case .hour: return Angle(degrees: (360 / 12) * (Double(time.hours) + Double(time.minutes) / 60))
//        case .minute: return Angle(degrees: Double(time.minutes) * 360 / 60)
//        case .second: return Angle(degrees: Double(time.seconds) * 360 / 60)
//        }
//    }
//}
