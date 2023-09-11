//
//  Indicators.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

enum IndicatorMode {
    case all, hoursOnly, none
}

struct Indicators {
    let mode: IndicatorMode
    
    let largeScale: CGFloat = 0.00005
    let smallScale: CGFloat = 0.000025
    
    init(mode: IndicatorMode) {
        self.mode = mode
    }
    
    var count: Int { mode == .none ? 0 : 60 }
    
    func isHour(_ index: Int) -> Bool { mode == .none ? false : index % 5 == 0 }
    
    func width(for index: Int) -> CGFloat {
        guard mode != .none else { return 0 }
        if mode == .hoursOnly && !isHour(index) { return 0 }
        return isHour(index) ? 2 : 1
    }
    
    func height(for index: Int) -> CGFloat { isHour(index) ? largeScale : smallScale }
    
    func rotation(for index: Int) -> Angle {
        Angle(degrees: mode == .none ? 0 : Double(index) * 360 / Double(count))
    }
}
