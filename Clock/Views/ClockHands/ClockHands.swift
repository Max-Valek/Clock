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

        ZStack {

            handProgressGradient(end: vm.hourRotationAngle, colors: vm.gradientColors(for: .hour))
                //.opacity(0.7)

            handProgressGradient(end: vm.minuteRotationAngle, colors: vm.gradientColors(for: .minute))
                //.opacity(0.5)

            handProgressGradient(end: vm.secondsRotationAngle, colors: vm.gradientColors(for: .second))
                //.opacity(0.35)

            ForEach(vm.hands, id: \.rawValue) { hand in
                HandView(type: hand, clock: clock)
            }

            Circle()
                .fill(vm.clock.colors.hours)
                .frame(width: vm.anchorWidth)
        }
    }

    func handProgressGradient(end: Angle, colors: [Color]) -> some View {
        Circle()
            .fill(.clear)
            .background {
                Path { path in
                    path.move(to: vm.center)
                    path.addArc(center: vm.center,
                                radius: vm.radius,
                                startAngle: vm.startAngle,
                                endAngle: end,
                                clockwise: false
                    )
                    path.closeSubpath()
                }
                .fill(
                    AngularGradient(
                        colors: colors,
                        center: .center,
                        startAngle: vm.startAngle,
                        endAngle: end)
                )
                .rotationEffect(.degrees(-90))
            }
    }
}
