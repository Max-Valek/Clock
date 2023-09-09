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
    
    @StateObject private var clockManager = ClockManager()
    
    var body: some View {
        ZStack {
            HourIndicators(clock: clockManager)
            
            ForEach(HandType.allCases, id: \.self) { hand in
                ClockHand(type: hand, clock: clockManager)
            }
        }
        .padding()
        .aspectRatio(1, contentMode: .fit)
        .onAppear { clockManager.subscribe() }
        .onDisappear { clockManager.unsubscribe() }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
            .preferredColorScheme(.dark)
    }
}
