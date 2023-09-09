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
    
    @StateObject var vm = ClockManager()
    
    var body: some View {
        ZStack {
            HourMarksView(vm)
            ForEach(HandType.allCases, id: \.self) { hand in
                HandView(for: hand, vm)
            }
        }
        .padding()
        .aspectRatio(1, contentMode: .fit)
        .onAppear { vm.subscribe() }
        .onDisappear { vm.unsubscribe() }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
            .environmentObject(ClockManager())
            .preferredColorScheme(.dark)
    }
}
