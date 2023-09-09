//
//  ClockHandsViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import Foundation

final class ClockHandsViewModel: ClockObserver {
    
    @Published var hands: [ClockHandType] = []
    
    override init(clockManager: ClockManager) {
        self.hands = Array(Set(clockManager.clock.hands))
        super.init(clockManager: clockManager)
    }
}
