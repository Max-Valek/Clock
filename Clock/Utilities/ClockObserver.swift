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
    
    private var cancellable: AnyCancellable?

    init(clockManager: ClockManager) {
        self.time = clockManager.time

        // Subscribe to changes in the ClockManager's time
        cancellable = clockManager.$time
            .sink { [weak self] newTime in
                self?.time = newTime
            }
    }
}
