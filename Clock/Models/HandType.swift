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
    
    //        var color: Color {
    //            switch self {
    //            case .hour: return .primary
    //            case .minute: return .primary
    //            case .second: return .secondary
    //            }
    //        }
    
    var color: LinearGradient {
        switch self {
        case .hour: return Metallic.gold.linearGradient
        case .minute: return Metallic.gold.linearGradient
        case .second: return Metallic.gold.linearGradient
        }
    }
    
    var thickness: CGFloat {
        switch self {
        case .hour: return 4
        case .second: return 1
        case .minute: return 2
        }
    }
    
    var relativeLength: CGFloat {
        switch self {
        case .hour: return 0.55
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
