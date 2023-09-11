//
//  ClockHandsViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

final class HandViewModel: ClockObserver {
    
    let type: ClockHandType
    
    init(type: ClockHandType, clockManager: ClockManager) {
        self.type = type
        super.init(clockManager: clockManager)
    }
    
    var color: Color {
        switch type {
        case .hour: return clock.hourColor
        case .minute: return clock.minuteColor
        case .second: return clock.secondColor
        }
    }
    
    var dynamicThickness: CGFloat {
        switch radius {
        case 0...100: return type.smallWidth
        case 101...200: return type.mediumWidth
        case 201...: return type.largeWidth
        default: return 0
        }
    }
    
    var length: CGFloat { type.lengthScale * radius }

    var anchorPoint: CGPoint { return CGPoint(x: radius, y: radius - (length / 2)) }

    var rotation: Angle { type.rotation(for: time) }
}
