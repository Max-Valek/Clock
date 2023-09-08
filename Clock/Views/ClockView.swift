//
//  ClockView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

/// View for a basic clock with hours, minutes, and seconds hands along with a marker for each hour.
struct ClockView: View {
    
//    @State(initialValue: Clock(date: Date()))
//    private var time: Clock
//
//    @State private var timerSubscription: Cancellable? = nil
    
    @StateObject private var clockManager = ClockManager()
    
    var body: some View {
        ZStack {
            HourIndicatorsViewView(time: clockManager.time)
            HandView(hand: .second, time: clockManager.time)
            HandView(hand: .hour, time: clockManager.time)
            HandView(hand: .minute, time: clockManager.time)
        }
        .padding()
        .aspectRatio(1, contentMode: .fit)
        .onAppear { clockManager.subscribe() }
        .onDisappear { clockManager.unsubscribe() }
    }
    
    /// Subscribe to timer to get its updates.
//    private func subscribe() {
//        timerSubscription = Timer.publish(every: 1, on: .main, in: .common)
//            .autoconnect()
//            .map(Clock.init)
//            .assign(to: \.time, on: self)
//    }
//
//    /// Unsubscribe from timer.
//    private func unsubscribe() {
//        timerSubscription?.cancel()
//    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
            .preferredColorScheme(.dark)
    }
}
