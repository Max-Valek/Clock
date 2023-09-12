//
//  HandView.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

struct HandView: View {

    @StateObject private var vm: HandViewModel

    init(type: ClockHandType, clock: ClockManager) {
        _vm = StateObject(wrappedValue: HandViewModel(type: type, clockManager: clock))
    }

    var body: some View {
        Capsule()
            .fill(vm.color)
            .frame(width: vm.thickness, height: vm.length)
            .position(vm.anchorPoint)
            .rotationEffect(vm.rotation)
    }
}
