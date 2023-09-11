//
//  ClockObserver.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

/// Superclass for view models that subscribe to ClockManager.
class ClockObserver: ObservableObject {
    
    @Published var time: ClockTime
    @Published var size: CGSize = .zero
    let clock: Clock
    
    let clockManager: ClockManager
    private var cancellables = Set<AnyCancellable>()
    
    init(clockManager: ClockManager) {
        self.clockManager = clockManager
        self.time = clockManager.time
        self.clock = clockManager.clock

        addSubscribers()
    }
    
    /// Keep track of the frame size.
    var center: CGPoint { CGPoint(x: radius, y: radius) }
    var radius: CGFloat { min(size.width, size.height) / 2 }
    
    /// Subscribe to changes in the ClockManager's published properties.
    func addSubscribers() {
        
        clockManager.$time
            .sink { [weak self] newTime in
                self?.time = newTime
            }
            .store(in: &cancellables)
        
        clockManager.$size
            .sink { [weak self] newSize in
                self?.size = newSize
            }
            .store(in: &cancellables)
    }
}
