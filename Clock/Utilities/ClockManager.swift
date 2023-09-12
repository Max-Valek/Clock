//
//  ClockManager.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

/// Publisher and source of truth for clock information.
class ClockManager: ObservableObject {
    
    @Published var time: ClockTime          /// Hours, minutes, seconds.
    @Published var size: CGSize = .zero     /// Frame size of clock's view.
    let clock: Clock                        /// Object representing the clock.
    
    @Published var timerSubscription: Cancellable? = nil    /// Subscription to Timer.
    
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
