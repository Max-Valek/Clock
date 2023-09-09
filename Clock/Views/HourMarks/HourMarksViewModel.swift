//
//  HourMarksViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine


class HourMarksViewModel: ClockObserver {

    @Published var size: CGSize = .zero

    let lengthMultiplier: CGFloat = 0.05
    
    override init(clockManager: ClockManager) {
        super.init(clockManager: clockManager)
    }
    
    func highlighted(_ hour: Int) -> Bool {
        markSeconds(hour) || markMinutes(hour) || markHours(hour)
    }

    func indicatorStyle(for hour: Int) -> LinearGradient {
        return LinearGradient(
            colors: [indicatorColor(for: hour)],
            startPoint: .topLeading, endPoint: .bottomTrailing
        )
    }

    func indicatorColor(for hour: Int) -> Color {
        if markSeconds(hour) { return ClockHand.second.color }
        if markHours(hour) { return ClockHand.hour.color }
        if markMinutes(hour) { return ClockHand.minute.color }
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

