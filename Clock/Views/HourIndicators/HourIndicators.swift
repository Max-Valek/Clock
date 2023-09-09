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
    
    init(clock: ClockManager) {
        _vm = StateObject(wrappedValue: ViewModel(clockManager: clock))
    }
    
    var body: some View {
        GeometryReader { proxy in
//            ForEach(0..<12) { hour in
//                Path { path in
//                    path.move(to: vm.topCenter)
//                    path.addLine(to: vm.indicatorEnd)
//                }
//                .stroke(
//                    vm.gradient(for: hour),
//                    lineWidth: vm.width(for: hour)
//                )
//                .rotationEffect(vm.rotation(for: hour))
//            }
//            .onAppear { vm.size = proxy.size }
            
            ForEach(0..<60) { second in
                Path { path in
                    path.move(to: vm.topCenter)
                    path.addLine(to: vm.indicatorEnd(for: second))
                }
                .stroke(
                    vm.gradient(for: second),
                    lineWidth: vm.width(for: second)
                )
                .rotationEffect(vm.rotation(for: second))
            }
            .onAppear { vm.size = proxy.size }
        }
    }
}

