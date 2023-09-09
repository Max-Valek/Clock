//
//  HourMarksView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// Draws a line indicator for each hour around the clock.
struct HourMarksView: View {
    
    @EnvironmentObject var clockManager: ClockManager

    var body: some View {
        
        let vm = HourMarksViewModel(time: clockManager.time)
        
        GeometryReader { proxy in
            
            ForEach(0..<12) { i in
                Path { path in
                    path.move(to: CGPoint(x: proxy.size.width / 2, y: 0))
                    path.addLine(to: CGPoint(
                        x: proxy.size.width / 2,
                        y: vm.lengthMultiplier * proxy.size.height)
                    )
                }
                .stroke(vm.indicatorStyle(for: i), lineWidth: vm.highlighted(i) ? 1 : 1)
                .rotationEffect(Angle(degrees: Double(i) * 360 / 12))
            }
            .onAppear { vm.size = proxy.size }
        }
    }
}

