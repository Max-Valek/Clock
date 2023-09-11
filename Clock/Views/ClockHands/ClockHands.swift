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
            
            Circle()
                .fill(.ultraThinMaterial)
                .background {
                    GeometryReader { proxy in
                        Path { path in
                            let center = CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2)
                            let radius = min(proxy.size.width, proxy.size.height) / 2.0

                            path.move(to: center)
                            path.addArc(center: center, radius: radius, startAngle: .degrees(0), endAngle: .degrees(270), clockwise: false)
                            path.closeSubpath()
                        }
                        .fill(
                            AngularGradient(
                                colors: [.red, .orange, .yellow, .green],
                                center: .center,
                                startAngle: .degrees(0),
                                endAngle: .degrees(270))
                        )
                        .rotationEffect(.degrees(-90))
                    }
                }
            
            ForEach(vm.hands, id: \.rawValue) { hand in
                HandView(type: hand, clock: clock)
            }
        }
    }
}
