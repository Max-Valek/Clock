//
//  HandView.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI


struct HandView: View {
    
    @StateObject private var vm: NewHandViewModel
    
    init(type: ClockHandType, clock: ClockManager) {
        _vm = StateObject(wrappedValue: NewHandViewModel(type: type, clockManager: clock))
    }
    
    var body: some View {
        GeometryReader { proxy in
            Capsule()
                .fill(vm.color)
                .frame(width: vm.thickness, height: vm.length)
                .position(vm.anchorPoint)
                .rotationEffect(vm.rotation)
                .onAppear { vm.size = proxy.size }
        }
    }
}
