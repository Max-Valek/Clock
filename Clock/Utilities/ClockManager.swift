//
//  ClockManager.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

class ClockManager: ObservableObject {
    
    @Published var time: Clock = Clock(date: Date())
    @Published var timerSubscription: Cancellable? = nil
    
    /// Subscribe to timer to get its updates.
    func subscribe() {
        timerSubscription = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .map(Clock.init)
            .assign(to: \.time, on: self)
    }
    
    // MARK: ClockView
    
    /// Unsubscribe from timer.
    func unsubscribe() {
        timerSubscription?.cancel()
    }
}
