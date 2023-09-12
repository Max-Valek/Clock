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
//                    .background(
//                        handProgressGradient(
//                            end: vm.rotation(hand: hand),
//                            colors: vm.gradientColors(for: hand)
//                        )
//                        .opacity(vm.gradientOpacity(for: hand))
//                    )
            }
            
            Circle()
                .fill(vm.anchorColor)
                .frame(width: vm.anchorWidth)
        }
    }

//    func handProgressGradient(end: Angle, colors: [Color]) -> some View {
//        Circle()
//            .fill(.clear)
//            .background {
//                Path { path in
//                    path.move(to: vm.center)
//                    path.addArc(center: vm.center,
//                                radius: vm.radius,
//                                startAngle: vm.startAngle,
//                                endAngle: end,
//                                clockwise: false
//                    )
//                    path.closeSubpath()
//                }
//                .fill(
//                    AngularGradient(
//                        colors: colors,
//                        center: .center,
//                        startAngle: vm.startAngle,
//                        endAngle: end)
//                )
//                .rotationEffect(.degrees(-90))
//            }
//    }
}
