//
//  HourMarksViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine


class HourMarksViewModel: ClockManagerObserver {

    override init(clockManager: ClockManager) {
        super.init(clockManager: clockManager)
    }
    
//    @Published var time: Clock
//
//    private var clockManager: ClockManager
//    private var cancellable: AnyCancellable?
//
//    init(clockManager: ClockManager) {
//        self.clockManager = clockManager
//        self.time = clockManager.time
//
//        // Subscribe to changes in the ClockManager's time
//        cancellable = clockManager.$time
//            .sink { [weak self] newTime in
//                self?.time = newTime
//            }
//    }

    @Published var size: CGSize = .zero

    let lengthMultiplier: CGFloat = 0.05

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

