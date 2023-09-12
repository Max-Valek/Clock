//
//  ClockHands.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

struct ClockHands: View {

    @StateObject private var vm: ViewModel
    @ObservedObject var clock: ClockManager

    init(clock: ClockManager) {
        self.clock = clock
        _vm = StateObject(wrappedValue: ViewModel(clockManager: clock))
    }

    var body: some View {
        ZStack {
            ForEach(vm.hands, id: \.rawValue) { hand in
                HandView(type: hand, clock: clock)
            }
            
            Circle()
                .fill(vm.anchorColor)
                .frame(width: vm.anchorWidth)
        }
    }
}
