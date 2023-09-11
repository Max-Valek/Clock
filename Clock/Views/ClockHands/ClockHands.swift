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
            backgroundGradient(start: .degrees(0), end: vm.minuteRotationAngle)
            
            ForEach(vm.hands, id: \.rawValue) { hand in
                HandView(type: hand, clock: clock)
            }
        }
    }
    
    func backgroundGradient(start: Angle, end: Angle) -> some View {
        Circle()
            .fill(.ultraThinMaterial)
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
                            colors: [.red, .orange, .yellow, .green],
                            center: .center,
                            startAngle: start,
                            endAngle: end)
                    )
                    .rotationEffect(.degrees(-90))
                }
            }
            .opacity(end == .degrees(0) ? 0 : 0.4)
    }
}
