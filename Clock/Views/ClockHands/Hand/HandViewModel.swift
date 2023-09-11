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

    var thickness: CGFloat {
        switch sizeMode {
        case .small: return type.smallWidth
        case .medium: return type.mediumWidth
        case .large: return type.largeWidth
        }
    }
    
    var length: CGFloat { type.lengthScale * radius }

    var anchorPoint: CGPoint { return CGPoint(x: radius, y: radius - (length / 2)) }

    var rotation: Angle { type.rotation(for: time) }
}
