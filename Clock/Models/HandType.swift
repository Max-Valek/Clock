//
//  HandType.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

enum HandType {
    case hour
    case minute
    case second
    
    var gradient: LinearGradient {
        switch self {
        case .hour: return Metallic.silver.linearGradient
        case .minute: return Metallic.silver.linearGradient
        case .second: return LinearGradient(colors: [.red], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }

    var thickness: CGFloat {
        switch self {
        case .hour: return 6
        case .second: return 2
        case .minute: return 4
        }
    }
    
    var relativeLength: CGFloat {
        switch self {
        case .hour: return 0.65
        case .minute: return 0.8
        case .second: return 0.85
        }
    }
    
    func angle(for time: Clock) -> Angle {
        switch self {
        case .hour: return Angle(degrees: (360 / 12) * (Double(time.hours) + Double(time.minutes) / 60))
        case .minute: return Angle(degrees: Double(time.minutes) * 360 / 60)
        case .second: return Angle(degrees: Double(time.seconds) * 360 / 60)
        }
    }
    
    func baseRadiusFactor(for time: Clock) -> CGFloat {
        switch self {
        case .hour: return 0.04
        case .minute: return 0.04
        case .second: return 0.04
        }
    }
}
