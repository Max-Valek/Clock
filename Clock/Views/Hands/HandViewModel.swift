//
//  ClockHandsViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

final class NewHandViewModel: ClockObserver {
    
    @Published var size: CGSize = .zero
    
    let type: ClockHandType
    
    init(type: ClockHandType, clockManager: ClockManager) {
        self.type = type
        super.init(clockManager: clockManager)
    }
    
    var color: Color { type.configuration.color }
    
    var thickness: CGFloat { type.configuration.thickness }
    var length: CGFloat {
        let radius = min(size.width, size.height) / 2
        return type.configuration.lengthScale * radius
    }
    
    var anchorPoint: CGPoint {
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        return CGPoint(x: center.x, y: center.y - (length / 2))
    }
    
    var rotation: Angle {
        type.rotation(for: time)
    }
    
    private func lengthFromCenter() -> CGFloat {
        let radius = min(size.width, size.height) / 2
        return type.configuration.lengthScale * radius
    }
}
