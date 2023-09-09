//
//  ClockHands.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

struct ClockHands: View {
    
    @StateObject private var vm: ClockHandsViewModel
    @ObservedObject var clock: ClockManager
    
    init(clock: ClockManager) {
        self.clock = clock
        _vm = StateObject(wrappedValue: ClockHandsViewModel(clockManager: clock))
    }
    
    var body: some View {
        ForEach(vm.hands, id: \.rawValue) { hand in
            HandView(type: hand, clock: clock)
        }
    }
}
