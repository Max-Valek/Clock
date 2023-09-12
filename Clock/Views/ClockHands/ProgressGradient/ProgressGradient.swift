//
//  ProgressGradient.swift
//  Clock
//
//  Created by Max Valek on 9/12/23.
//

import SwiftUI

struct ProgressGradient: View {
    
    @StateObject private var vm: ViewModel

    init(type: ClockHandType, clock: ClockManager) {
        _vm = StateObject(wrappedValue: ViewModel(type: type, clockManager: clock))
    }
    
    var body: some View {
        Circle()
            .fill(.clear)
            .background {
                progressSlice
                    .fill(sliceGradient)
                    .rotationEffect(.degrees(-90))  /// To start at top
            }
            .opacity(vm.gradientOpacity)
    }
}

extension ProgressGradient {
    /// Portion of the clock the fill with the gradient.
    private var progressSlice: Path {
        Path { path in
            path.move(to: vm.center)
            path.addArc(center: vm.center,
                        radius: vm.radius,
                        startAngle: vm.startAngle,
                        endAngle: vm.rotation,
                        clockwise: false
            )
            path.closeSubpath()
        }
    }
    /// Gradient to fill the progress with.
    private var sliceGradient: AngularGradient {
        AngularGradient(
            colors: vm.gradientColors,
            center: .center,
            startAngle: vm.startAngle,
            endAngle: vm.rotation)
    }
}
