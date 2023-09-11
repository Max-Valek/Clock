//
//  ClockHandsViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

final class HandViewModel: ClockObserver {
    
    @Published var size: CGSize = .zero
    let clock: Clock
    let type: ClockHandType
    
    init(type: ClockHandType, clockManager: ClockManager) {
        self.clock = clockManager.clock
        self.type = type
        super.init(clockManager: clockManager)
    }
    
    //var color: Color { type.configuration.color }

    var color: Color {
        switch type {
        case .hour: return clock.hourColor
        case .minute: return clock.minuteColor
        case .second: return clock.secondColor
        }
    }
    var thickness: CGFloat { type.configuration.thickness }

    var length: CGFloat { type.configuration.lengthScale * radius }

    var anchorPoint: CGPoint { return CGPoint(x: radius, y: radius - (length / 2)) }

    var rotation: Angle { type.rotation(for: time) }

    private var radius: CGFloat { min(size.width, size.height) / 2 }
}
