//
//  Indicators.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

/// Can show all (hours and minutes), only hours, or no indicators.
enum IndicatorMode {
    case all, hoursOnly, none
}

/// Represents the dashes indicating hours/minutes around the clock.
struct Indicators {
    let mode: IndicatorMode
    let largeScale: CGFloat = 0.00005
    let smallScale: CGFloat = 0.000025
    
    init(mode: IndicatorMode) {
        self.mode = mode
    }
    
    /// Number of indicators based on the mode.
    var count: Int { mode == .none ? 0 : 60 }
    
    /// If the specific indicator is an hour (large) indicator).
    func isHour(_ index: Int) -> Bool { mode == .none ? false : index % 5 == 0 }
    
    /// Width for the indicator.
    func width(for index: Int) -> CGFloat {
        guard mode != .none else { return 0 }
        if mode == .hoursOnly && !isHour(index) { return 0 }
        return isHour(index) ? 2 : 1
    }
    
    /// Height for the indicator.
    func height(for index: Int) -> CGFloat { isHour(index) ? largeScale : smallScale }
    
    /// Calculate how much to rotate the indicator around the clock.
    func rotation(for index: Int) -> Angle {
        Angle(degrees: mode == .none ? 0 : Double(index) * 360 / Double(count))
    }
}
