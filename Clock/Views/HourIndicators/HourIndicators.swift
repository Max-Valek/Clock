//
//  HourIndicators.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// Draws a line indicator for each hour around the clock.
struct HourIndicators: View {
    
    @StateObject private var vm: ViewModel
    
    init(mode: IndicatorMode, clock: ClockManager) {
        _vm = StateObject(wrappedValue: ViewModel(mode: mode, clockManager: clock))
    }
    
    var body: some View {
        GeometryReader { proxy in
            ForEach(0..<60) { second in
                Path { path in
                    path.move(to: vm.topCenter)
                    path.addLine(to: vm.indicatorEnd(for: second))
                }
                .stroke(
                    vm.color(for: second),
                    lineWidth: vm.width(for: second)
                )
                .rotationEffect(vm.rotation(for: second))
            }
            .onAppear { vm.size = proxy.size }
        }
    }
}

