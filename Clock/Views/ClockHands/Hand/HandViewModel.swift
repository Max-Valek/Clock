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
        case .hour: return clock.colors.hours
        case .minute: return clock.colors.minutes
        case .second: return clock.colors.seconds
        }
    }
    
    var thickness: CGFloat {
        switch sizeMode {
        case .small: return type.widths[0]
        case .medium: return type.widths[1]
        case .large: return type.widths[2]
        }
    }

    var length: CGFloat { type.lengthScale * radius }

    var anchorPoint: CGPoint { return CGPoint(x: radius, y: radius - (length / 2)) }
    
    var rotation: Angle { type.rotation(for: time) }
}
