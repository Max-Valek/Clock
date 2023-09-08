//
//  HandView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

struct HandView: View {
    
    let type: HandType
    let time: Clock
    
    var body: some View {
        GeometryReader { proxy in
            /// The indicator's base circle (in the middle of the clock)
            Path { path in
                path.addArc(
                    center: self.center(of: proxy.size),
                    radius: self.baseCircleRadius(proxy),
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 360),
                    clockwise: true
                )
            }
            .fill(self.type.color)
            
            /// The indicator line.
            Path { path in
                let center = self.center(of: proxy.size)
                path.move(to: center)
                /// Draw a line from the center to the top. Rotated later.
                path.addLine(to: CGPoint(
                    x: center.x,
                    y: center.y - indicatorLength(proxy))
                )
            }
            .stroke(style: StrokeStyle(
                lineWidth: self.type.thickness,
                lineCap: .round)
            )
            .fill(self.type.color)
            /// Rotate indicator based on time.
            .rotationEffect(self.type.angle(for: self.time))
        }
    }
    
    /// Calculate and return the center point of the clock.
    private func center(of size: CGSize) -> CGPoint {
        CGPoint(x: size.width / 2, y: size.height / 2)
    }
    /// Calculate and return the radius of the indicator's base circle.
    private func baseCircleRadius(_ proxy: GeometryProxy) -> CGFloat {
        0.5 * self.type.baseRadiusFactor(for: self.time) * min(proxy.size.width, proxy.size.height)
    }
    /// Calculate and return the indicator's length.
    private func indicatorLength(_ proxy: GeometryProxy) -> CGFloat {
        self.type.relativeLength * self.clockRadius(for: proxy.size)
    }
    /// Calculate and return the radius of the clock.
    private func clockRadius(for size: CGSize) -> CGFloat {
        min(size.width, size.height) / 2
    }
}

struct HandView_Previews: PreviewProvider {
    static var previews: some View {
        HandView(type: .hour, time: .init(date: .now))
            .preferredColorScheme(.dark)
    }
}
