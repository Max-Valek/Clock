//
//  ClockView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

struct ClockView: View {
    
    @State(initialValue: Clock(date: Date()))
    private var time: Clock
    
    @State private var timerSubscription: Cancellable? = nil
    
    var body: some View {
        ZStack {
            HourMarksView()
            HandView(type: .second, time: time)
            HandView(type: .hour, time: time)
            HandView(type: .minute, time: time)
        }
        .padding()
        .aspectRatio(1, contentMode: .fit)
        .onAppear { self.subscribe() }
        .onDisappear { self.unsubscribe() }
    }
    
    private func subscribe() {
        timerSubscription = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .map(Clock.init)
            .assign(to: \.time, on: self)
    }
    
    private func unsubscribe() {
        timerSubscription?.cancel()
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
            .preferredColorScheme(.dark)
    }
}
