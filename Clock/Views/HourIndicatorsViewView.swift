//
//  HourMarksView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// Draws a line indicator for each hour around the clock.
struct HourIndicatorsViewView: View {
    
    let time: Clock
    
    private let lengthMultiplier: CGFloat = 0.05
    
    @State private var isHighlighted: Bool = false
    
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
                .stroke(indicatorStyle(for: i), lineWidth: highlighted(i) ? 1 : 1)
                .rotationEffect(Angle(degrees: Double(i) * 360 / 12))
            }
        }
    }
    
    func highlighted(_ hour: Int) -> Bool {
        let status = markSeconds(hour) || markMinutes(hour) || markHours(hour)
        if self.isHighlighted != status {
            withAnimation {
                self.isHighlighted.toggle()
            }
        }
        return status
    }
    
    func indicatorStyle(for hour: Int) -> LinearGradient {
        return LinearGradient(
            colors: [indicatorColor(for: hour)],
            startPoint: .topLeading, endPoint: .bottomTrailing
        )
    }
    
    func indicatorColor(for hour: Int) -> Color {
        if markSeconds(hour) { return HandType.second.color }
        if markHours(hour) { return HandType.hour.color }
        if markMinutes(hour) { return HandType.minute.color }
        return .gray
    }
    
    func markSeconds(_ hour: Int) -> Bool {
        time.seconds % 5 == 0 && time.seconds / 5 == hour
    }
    
    func markMinutes(_ hour: Int) -> Bool {
        time.minutes / 5 >= hour && time.minutes / 5 < hour + 1
    }
    
    func markHours(_ hour: Int) -> Bool {
        time.hours >= hour && time.hours < hour + 1
    }
}
