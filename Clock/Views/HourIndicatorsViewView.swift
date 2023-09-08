//
//  HourMarksView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// Draws a line indicator for each hour around the clock.
struct HourIndicatorsViewView: View {
    
    private let lengthMultiplier: CGFloat = 0.05
    
    var body: some View {
        GeometryReader { proxy in
            ForEach(0..<12) { i in
                Path { path in
                    path.move(to: CGPoint(x: proxy.size.width / 2, y: 0))
                    path.addLine(to: CGPoint(
                        x: proxy.size.width / 2,
                        y: self.lengthMultiplier * proxy.size.height)
                    )
                }
                .stroke(Metallic.silver.linearGradient, lineWidth: 2)
                .rotationEffect(Angle(degrees: Double(i) * 360 / 12))
            }
        }
    }
}
