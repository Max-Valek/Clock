//
//  ClockHandsViewModel.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

//protocol HandType {
//    var lengthScale: CGFloat { get }
//    func width(sizeMode: ClockSize) -> CGFloat
//    func rotation(for time: ClockTime) -> Angle
//}
//
//struct SecondHand: HandType {
//    var lengthScale: CGFloat { 0.8 }
//    func width(sizeMode: ClockSize) -> CGFloat { 1 }
//    func rotation(for time: ClockTime) -> Angle {
//        Angle(degrees: Double(time.minutes) * 360 / 60)
//    }
//}
//
//struct MinuteHand: HandType {
//    var lengthScale: CGFloat { 0.8 }
//    func width(sizeMode: ClockSize) -> CGFloat {
//        switch sizeMode {
//        case .small: return 2
//        case .medium: return 3
//        case .large: return 4
//        }
//    }
//    func rotation(for time: ClockTime) -> Angle {
//        Angle(degrees: Double(time.minutes) * 360 / 60)
//    }
//}
//
//struct HourHand: HandType {
//    var lengthScale: CGFloat { 0.6 }
//    func width(sizeMode: ClockSize) -> CGFloat {
//        switch sizeMode {
//        case .small: return 3
//        case .medium: return 5
//        case .large: return 8
//        }
//    }
//    func rotation(for time: ClockTime) -> Angle {
//        Angle(degrees: (360 / 12) * (Double(time.hours) + Double(time.minutes) / 60))
//    }
//}
//
//enum HandEnum {
//    case hour, minute, second
//}
//
//struct CHands {
//
//    let hands: [HandType]
//
//    init(types: [HandEnum]) {
//
//    }
//}
//
//final class ClockHandsViewModel: ClockObserver {
//
//    @Published var hands: [HandType] = []
//
//    override init(clockManager: ClockManager) {
//        createHands(from: clockManager.clock.hands)
//        super.init(clockManager: clockManager)
//    }
//
//    func createHands(from types: [ClockHandType]) {
//        let types = Array(Set(types))
//
//        hands = types.map {
//            switch $0 {
//            case .hour: return HourHand()
//            case .minute: return MinuteHand()
//            case .second: return SecondHand()
//            }
//        }
//    }
//
//    var startAngle: Angle { .degrees(0) }
//
//    var hourRotationAngle: Angle {
//        if let index = hands.firstIndex(of: .hour) {
//            let angle = hands[index].rotation(for: time)
//            return time.hours > 0 ? angle : angle - .degrees(360)
//        }
//
//        return .degrees(0)
//    }
//
//
//    var minuteRotationAngle: Angle {
//        if let index = hands.firstIndex(of: .minute) {
//            let angle = hands[index].rotation(for: time)
//            return angle == .degrees(0) ? .degrees(0) : angle
//        }
//
//        return .degrees(0)
//    }
//
//    var secondsRotationAngle: Angle {
//        if let index = hands.firstIndex(of: .second) {
//            let angle = hands[index].rotation(for: time)
//            return angle == .degrees(0) ? .degrees(0) : angle
//        }
//
//        return .degrees(0)
//    }
//
//    var anchorColor: Color { clock.secondColor }
//
//    var anchorWidth: CGFloat { 0 }
//
//    func gradientColors(for hand: ClockHandType) -> [Color] {
//        switch hand {
//        case .hour: return [.clear, clock.hourColor.opacity(0.25)]
//        case .minute: return [.clear, clock.minuteColor.opacity(0.25)]
//        case .second: return [.clear, clock.secondColor.opacity(0.25)]
//        }
//    }
//}

final class ClockHandsViewModel: ClockObserver {

    @Published var hands: [ClockHandType] = []

    override init(clockManager: ClockManager) {
        self.hands = Array(Set(clockManager.clock.hands))
        super.init(clockManager: clockManager)
    }

    var startAngle: Angle { .degrees(0) }

    var hourRotationAngle: Angle {
        if let index = hands.firstIndex(of: .hour) {
            let angle = hands[index].rotation(for: time)
            return time.hours > 0 ? angle : angle - .degrees(360)
        }

        return .degrees(0)
    }


    var minuteRotationAngle: Angle {
        if let index = hands.firstIndex(of: .minute) {
            let angle = hands[index].rotation(for: time)
            return angle == .degrees(0) ? .degrees(0) : angle
        }

        return .degrees(0)
    }

    var secondsRotationAngle: Angle {
        if let index = hands.firstIndex(of: .second) {
            let angle = hands[index].rotation(for: time)
            return angle == .degrees(0) ? .degrees(0) : angle
        }

        return .degrees(0)
    }

    var anchorColor: Color { clock.secondColor }

    var anchorWidth: CGFloat { 0 }

    func gradientColors(for hand: ClockHandType) -> [Color] {
        switch hand {
        case .hour: return [.clear, clock.hourColor.opacity(0.25)]
        case .minute: return [.clear, clock.minuteColor.opacity(0.25)]
        case .second: return [.clear, clock.secondColor.opacity(0.25)]
        }
    }
}
