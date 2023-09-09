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
    
    var length: CGFloat { type.configuration.lengthScale * radius }
    
    var anchorPoint: CGPoint { return CGPoint(x: radius, y: radius - (length / 2)) }
    
    var rotation: Angle { type.rotation(for: time) }
    
    private var radius: CGFloat { min(size.width, size.height) / 2 }
}
