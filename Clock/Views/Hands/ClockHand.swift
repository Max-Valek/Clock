//
//  ClockHand.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// View representing a hand on the clock, rotated based on time.
struct ClockHand: View {
    
    @StateObject private var vm: ViewModel
    
    init(type: HandType, clock: ClockManager) {
        _vm = StateObject(wrappedValue: ViewModel(type: type, clockManager: clock))
    }
    
    var body: some View {
        GeometryReader { proxy in
            Capsule()
                .fill(vm.type.color)
                .frame(width: vm.type.thickness, height: vm.totalLength)
                .position(vm.anchorPoint)
                .rotationEffect(vm.rotation)
                .onAppear { vm.size = proxy.size }
        }
    }
}
