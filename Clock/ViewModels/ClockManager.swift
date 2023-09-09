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

/*
 @Published var time: Clock

 private var clockManager: ClockManager
 private var cancellable: AnyCancellable?

 init(clockManager: ClockManager) {
     self.clockManager = clockManager
     self.time = clockManager.time

     // Subscribe to changes in the ClockManager's time
     cancellable = clockManager.$time
         .sink { [weak self] newTime in
             self?.time = newTime
         }
 }
 */

class ClockManagerObserver: ObservableObject {
    
    @Published var time: Clock
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

class Obs: ClockManagerObserver {
    
    override init(clockManager: ClockManager) {
        super.init(clockManager: clockManager)
    }
}
