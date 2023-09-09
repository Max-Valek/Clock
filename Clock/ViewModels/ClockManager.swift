//
//  ClockManager.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

class ClockManager: ObservableObject {
    
    @Published var time: Clock = Clock(date: Date())
    
    @Published var timerSubscription: Cancellable? = nil
    
    /// Subscribe to timer to get its updates.
    func subscribe() {
        timerSubscription = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .map(Clock.init)
            .assign(to: \.time, on: self)
    }
    
    // MARK: ClockView
    
    /// Unsubscribe from timer.
    func unsubscribe() {
        timerSubscription?.cancel()
    }
    
//    func highlighted(_ hour: Int) -> Bool {
//        markSeconds(hour) || markMinutes(hour) || markHours(hour)
//    }
    
    // MARK: HourMarksView
    
//    func indicatorStyle(for hour: Int) -> LinearGradient {
//        return LinearGradient(
//            colors: [indicatorColor(for: hour)],
//            startPoint: .topLeading, endPoint: .bottomTrailing
//        )
//    }
//    
//    func indicatorColor(for hour: Int) -> Color {
//        if markSeconds(hour) { return HandType.second.color }
//        if markHours(hour) { return HandType.hour.color }
//        if markMinutes(hour) { return HandType.minute.color }
//        return .gray
//    }
//    
//    func markSeconds(_ hour: Int) -> Bool {
//        time.seconds % 5 == 0 && time.seconds / 5 == hour
//    }
//    
//    func markMinutes(_ hour: Int) -> Bool {
//        time.minutes / 5 >= hour && time.minutes / 5 < hour + 1
//    }
//    
//    func markHours(_ hour: Int) -> Bool {
//        time.hours >= hour && time.hours < hour + 1
//    }
    
    // MARK: HandView
    
    /// Starting point for the hand. Center of the clock offset by amount to overlap.
//    func startingPoint() -> CGPoint {
//        let center = CGPoint(x: size.width / 2, y: size.height / 2)
//        let mid = totalLength() / 2
//        let amountToOffset = mid - overlapAmount()
//        return CGPoint(x: center.x, y: center.y - amountToOffset)
//    }
//
//    /// Length of hand with added amount for overlap.
//    func totalLength() -> CGFloat {
//        lengthFromCenter() + overlapAmount()
//    }
//    
//    /// Amount to add past the center for overlapping.
//    func overlapAmount() -> CGFloat {
//        lengthFromCenter() * overlapMultiplier
//    }
//    
//    /// Length of hand from center of the clock.
//    func lengthFromCenter() -> CGFloat {
//        let radius = min(size.width, size.height) / 2
//        return self.hand.lengthMultiplier * radius
//    }
}
