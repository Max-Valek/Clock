//
//  Clock.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

/// View for a basic clock with hours, minutes, and seconds hands along with a marker for each hour.
struct AnalogClock<HandAnchor: View>: View {
    
    @StateObject private var clockManager: ClockManager
    
    let anchor: HandAnchor
    
    init(hands: [ClockHandType] = [.hour, .minute, .second],
         mode: IndicatorMode = .all,
         primaryColor: Color = .primary,
         secondaryColor: Color = .red,
         anchor: @escaping () -> HandAnchor
    ) {
        let clock = Clock(
            hands: hands,
            indicatorMode: mode,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor
        )
        _clockManager = StateObject(wrappedValue: ClockManager(clock: clock))
        self.anchor = anchor()
    }
    
    var body: some View {
        ZStack {
            HourIndicators(clock: clockManager)
            
            ClockHands(clock: clockManager)
            
            anchor
        }
        .padding()
        .aspectRatio(1, contentMode: .fit)
        .onAppear { clockManager.subscribe() }
        .onDisappear { clockManager.unsubscribe() }
    }
}

struct AnalogClock_Previews: PreviewProvider {
    static var previews: some View {
        AnalogClock(
            hands: [.hour, .minute, .second],
            mode: .hoursOnly,
            primaryColor: .primary,
            secondaryColor: .red
        ) {
            Circle()
                .fill(.red)
                .frame(width: 20)
        }
        .preferredColorScheme(.dark)
    }
}
