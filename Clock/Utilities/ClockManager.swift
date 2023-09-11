//
//  ClockManager.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

struct ClockStyle {
    
}

class ClockManager: ObservableObject {
    
    @Published var time: ClockTime
    @Published var timerSubscription: Cancellable? = nil
    
    let clock: Clock
    
    @Published var size: CGSize = .zero
    
    init(clock: Clock) {
        self.clock = clock
        self.time = clock.time
    }
    
    /// Subscribe to timer to get its updates.
    func subscribe() {
        timerSubscription = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .map(ClockTime.init)
            .assign(to: \.time, on: self)
    }
    
    /// Unsubscribe from timer.
    func unsubscribe() {
        timerSubscription?.cancel()
    }
}
