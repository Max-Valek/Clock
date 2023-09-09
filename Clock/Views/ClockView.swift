//
//  ClockView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI
import Combine

/// View for a basic clock with hours, minutes, and seconds hands along with a marker for each hour.
struct ClockView<HandAnchor: View>: View {
    
    @StateObject private var clockManager = ClockManager()
    let hands: Hands
    let anchor: HandAnchor
    let indicatorMode: IndicatorMode
    
    init(hands: [ClockHandType] = [.hour, .minute, .second], mode: IndicatorMode = .all, anchor: @escaping () -> HandAnchor) {
        self.hands = Hands(types: hands)
        self.indicatorMode = mode
        self.anchor = anchor()
    }
    
    var body: some View {
        ZStack {
            HourIndicators(mode: indicatorMode, clock: clockManager)
            
            ForEach(hands.types, id: \.self) { hand in
                HandView(type: hand, clock: clockManager)
            }
            
            anchor
        }
        .padding()
        .aspectRatio(1, contentMode: .fit)
        .onAppear { clockManager.subscribe() }
        .onDisappear { clockManager.unsubscribe() }
    }
    
//    @StateObject private var clockManager = ClockManager()
//
//    /* Possible props
//     Indicators:
//     - hour and minute scale
//     - show minutes
//
//     Hands:
//     - array of hand types
//
//     Middle circle:
//     - color (or secondary)
//     - size
//     */
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(hands: [.hour, .minute, .second], mode: .all) {
            Circle()
                .fill(.red)
                .frame(maxWidth: 20)
        }
        .preferredColorScheme(.dark)
    }
}
