//
//  HandView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// View representing a hand on the clock, rotated based on time.
struct HandView: View {
    
//    @EnvironmentObject var clockManager: ClockManager
//    @StateObject var vm: HandViewModel
//
//    init(hand: HandType) {
//        _vm = StateObject(wrappedValue: HandViewModel(hand: hand))
//    }
    
    @StateObject var vm: HandViewModel
    
    init(for type: HandType, _ clock: ClockManager) {
        _vm = StateObject(wrappedValue: HandViewModel(type: type, clockManager: clock))
    }
    
    var body: some View {
        GeometryReader { proxy in
            Capsule()
                .fill(vm.type.color)
                .frame(width: vm.type.thickness, height: vm.totalLength())
                .position(vm.startingPoint())
                .rotationEffect(vm.type.rotationAngle(for: vm.time))
                .onAppear { vm.size = proxy.size }
        }
    }
}

struct HandView_Previews: PreviewProvider {
    static var previews: some View {
        HandView(for: .hour, ClockManager())
        //HandView(hand: .hour)
            //.environmentObject(ClockManager())
    }
}
