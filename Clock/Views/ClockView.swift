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
    
    @EnvironmentObject var clockManager: ClockManager
    
    var body: some View {
        ZStack {
            HourMarksView()
            HandView(hand: .second)
            HandView(hand: .hour)
            HandView(hand: .minute)
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
            .environmentObject(ClockManager())
            .preferredColorScheme(.dark)
    }
}
