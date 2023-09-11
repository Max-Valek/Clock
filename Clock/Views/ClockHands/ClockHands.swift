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
            backgroundGradient(start: .degrees(0), end: vm.secondsRotationAngle, color: .red)
                .opacity(0.25)
            
            backgroundGradient(start: .degrees(0), end: vm.minuteRotationAngle, color: .primary)
                .opacity(0.5)
            
            backgroundGradient(start: .degrees(0), end: vm.hourRotationAngle - .degrees(360), color: .green)
            
            ForEach(vm.hands, id: \.rawValue) { hand in
                HandView(type: hand, clock: clock)
            }
        }
    }
    
    func backgroundGradient(start: Angle, end: Angle, color: Color) -> some View {
        Circle()
            .fill(.clear)
            .background {
                GeometryReader { proxy in
                    Path { path in
                        path.move(to: vm.center(of: proxy))
                        path.addArc(center: vm.center(of: proxy),
                                    radius: vm.radius(of: proxy),
                                    startAngle: start,
                                    endAngle: end,
                                    clockwise: false
                        )
                        path.closeSubpath()
                    }
                    .fill(
                        AngularGradient(
                            colors: [.clear, color],
                            center: .center,
                            startAngle: start,
                            endAngle: end)
                    )
                    .rotationEffect(.degrees(-90))
                }
            }
            //.overlay(Circle().fill(.ultraThinMaterial.opacity(0.4)))
            .opacity(end == .degrees(0) ? 0 : 1)
    }
}
