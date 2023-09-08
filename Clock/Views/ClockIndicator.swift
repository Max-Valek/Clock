//
//  ClockIndicator.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

struct ClockIndicator: View {
    
    let type: IndicatorType
    let time: Clock
    
    var body: some View {
        GeometryReader { proxy in
            Path { path in
                let center = self.center(of: proxy.size)
                let baseRadius = 0.5 * self.type.baseRadiusFactor(for: self.time) * min(proxy.size.width, proxy.size.height)
                path.addArc(center: center, radius: baseRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
            }
            .fill(self.type.color)
            
            Path { path in
                let center = self.center(of: proxy.size)
                path.move(to: center)
                path.addLine(to: CGPoint(x: center.x, y: center.y - self.type.relativeLength * self.radius(for: proxy.size)))
            }
            .stroke(style: StrokeStyle(lineWidth: self.type.thickness, lineCap: .round))
            .fill(self.type.color)
            .rotationEffect(self.type.angle(for: self.time))
        }
    }
    
    private func center(of size: CGSize) -> CGPoint {
        CGPoint(x: size.width / 2, y: size.height / 2)
    }
    
    private func radius(for size: CGSize) -> CGFloat {
        min(size.width, size.height) / 2
    }
}

struct ClockIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ClockIndicator(type: .hour, time: .init(date: .now))
            .preferredColorScheme(.dark)
    }
}
