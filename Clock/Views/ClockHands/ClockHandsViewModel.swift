//
//  ClockHandsViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

final class ClockHandsViewModel: ClockObserver {
    
    @Published var hands: [ClockHandType] = []
    
    override init(clockManager: ClockManager) {
        self.hands = Array(Set(clockManager.clock.hands))
        super.init(clockManager: clockManager)
    }
    
    var startAngle: Angle { .degrees(0) }
    
    var hourRotationAngle: Angle {
        if let index = hands.firstIndex(of: .hour) {
            let angle = hands[index].rotation(for: time)
            return time.hours > 0 ? angle : angle - .degrees(360)
        }
        
        return .degrees(0)
    }
    
    
    var minuteRotationAngle: Angle {
        if let index = hands.firstIndex(of: .minute) {
            let angle = hands[index].rotation(for: time)
            return angle == .degrees(0) ? .degrees(0) : angle
        }
        
        return .degrees(0)
    }
    
    var secondsRotationAngle: Angle {
        if let index = hands.firstIndex(of: .second) {
            let angle = hands[index].rotation(for: time)
            return angle == .degrees(0) ? .degrees(0) : angle
        }
        
        return .degrees(0)
    }
    
    var anchorColor: Color { clock.secondColor }
    
    var anchorWidth: CGFloat { 0 }

    func gradientColors(for hand: ClockHandType) -> [Color] {
        switch hand {
        case .hour: return [.clear, clock.hourColor.opacity(0.25)]
        case .minute: return [.clear, clock.minuteColor.opacity(0.25)]
        case .second: return [.clear, clock.secondColor.opacity(0.25)]
        }
    }
}
