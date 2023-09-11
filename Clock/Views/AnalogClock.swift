//
//  Clock.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

/// View for a basic clock with hours, minutes, and seconds hands along with a marker for each hour.
struct AnalogClock: View {
    
    @StateObject private var clockManager: ClockManager
    
    init(hands: [ClockHandType] = [.hour, .minute, .second],
         mode: IndicatorMode = .hoursOnly,
         hourColor: Color = .primary,
         minuteColor: Color = .orange,
         secondColor: Color = .purple
    ) {
        let clock = Clock(
            hands: hands,
            indicatorMode: mode,
            hourColor: hourColor,
            minuteColor: minuteColor,
            secondColor: secondColor
        )
        _clockManager = StateObject(wrappedValue: ClockManager(clock: clock))
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HourIndicators(clock: clockManager)
                
                ClockHands(clock: clockManager)
                
                Circle()
                    .fill(clockManager.clock.hourColor)
                    .frame(width: 12)
            }
            .background(Circle().fill(.ultraThickMaterial))
            //.clipped()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .onAppear {
                clockManager.size = geometry.size
                clockManager.subscribe()
            }
            .onDisappear { clockManager.unsubscribe() }
        }
    }
}

struct AnalogClock_Previews: PreviewProvider {
    static var previews: some View {
        AnalogClock(
            hands: [.hour, .minute, .second],
            mode: .all,
            hourColor: .primary,
            minuteColor: .orange,
            secondColor: .purple
        )
        .preferredColorScheme(.dark)
    }
}
