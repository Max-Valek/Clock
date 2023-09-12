//
//  HandView.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

struct HandView: View {

    @StateObject private var vm: ViewModel

    init(type: HandType, clock: ClockManager) {
        _vm = StateObject(wrappedValue: ViewModel(type: type, clockManager: clock))
    }

    var body: some View {
        ZStack {
            ProgressGradient(type: vm.type, clock: vm.clockManager)
            
            Capsule()
                .fill(vm.color)
                .frame(width: vm.thickness, height: vm.length)
                .position(vm.anchorPoint)
                .rotationEffect(vm.rotation)
        }
    }
}
