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
            
            backgroundGradient(end: vm.hourRotationAngle, colors: vm.gradientColors(for: .hour))
                //.opacity(0.7)
            
            backgroundGradient(end: vm.minuteRotationAngle, colors: vm.gradientColors(for: .minute))
                //.opacity(0.5)
            
            backgroundGradient(end: vm.secondsRotationAngle, colors: vm.gradientColors(for: .second))
                //.opacity(0.35)
            
            ForEach(vm.hands, id: \.rawValue) { hand in
                HandView(type: hand, clock: clock)
            }
        }
    }
    
    func backgroundGradient(end: Angle, colors: [Color]) -> some View {
        Circle()
            .fill(.clear)
            .background {
                GeometryReader { proxy in
                    Path { path in
                        path.move(to: vm.center(of: proxy))
                        path.addArc(center: vm.center(of: proxy),
                                    radius: vm.radius(of: proxy),
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
            //.overlay(Circle().fill(.ultraThinMaterial.opacity(0.4)))
            .opacity(end == .degrees(0) ? 0 : 1)
    }
}
