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
    
    //private var cancellable: AnyCancellable?

    private var cancellables = Set<AnyCancellable>()
    
    init(clockManager: ClockManager) {
        self.time = clockManager.time
        self.clock = clockManager.clock

        // Subscribe to changes in the ClockManager's time
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
