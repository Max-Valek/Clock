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
            Path { path in
                let start = self.startingPoint(proxy)
                path.move(to: start)
                /// draw upwards, rotated later.
                path.addLine(to: CGPoint(
                    x: start.x,
                    y: start.y - totalLength(proxy))
                )
            }
            .stroke(style: StrokeStyle(
                lineWidth: self.type.thickness,
                lineCap: .round)
            )
            .fill(self.type.gradient)
            //.shadow(color: .black.opacity(0.7), radius: 1, x: 1, y: 1)
            /// Rotate indicator based on time.
            .rotationEffect(self.type.rotationAngle(for: self.time))
        }
    }
    /// Calculate and return the center point of the clock.
    private func startingPoint(_ proxy: GeometryProxy) -> CGPoint {
        /// center of the clock
        let center = CGPoint(x: proxy.size.width / 2, y: (proxy.size.height / 2))
        /// length from center to end of hand
        let size = self.type.lengthMultiplier * self.clockRadius(for: proxy.size)
        /// overlap a little in the middle
        let overlapAmount = size / 4
        return CGPoint(x: center.x, y: center.y + overlapAmount)
    }
    
    private func totalLength(_ proxy: GeometryProxy) -> CGFloat {
        let fromCenter = self.type.lengthMultiplier * self.clockRadius(for: proxy.size)
        let overlapAmount = fromCenter / 4
        return fromCenter + overlapAmount
    }

    /// Calculate and return the indicator's length.
//    private func indicatorLength(_ proxy: GeometryProxy) -> CGFloat {
//        self.type.relativeLength * self.clockRadius(for: proxy.size)
//    }
    
//    private func overlapAmount(_ proxy: GeometryProxy) -> CGFloat {
//        indicatorLength(proxy) / 4
//    }
    
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
