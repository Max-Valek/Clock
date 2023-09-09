//
//  Indicators.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

enum IndicatorMode {
    case all, hoursOnly, none
    
    static let hourScale: CGFloat = 0.05
    static let minuteScale: CGFloat = 0.025
}

enum IndicatorType {
    case hour, minute
    
    var lengthScale: CGFloat {
        switch self {
        case .hour: return 0.05
        case .minute: return 0.025
        }
    }
}

struct Indicators {
    
    let mode: IndicatorMode
    
    static let hourScale: CGFloat = 0.05
    static let minuteScale: CGFloat = 0.025
    
    init(mode: IndicatorMode = .all) {
        self.mode = mode
    }
    
    var count: Int {
//        switch mode {
//        case .all: return 60
//        case .hoursOnly: return 12
//        case .none: return 0
//        }

        mode == .none ? 0 : 60
    }
    
    func isHour(_ index: Int) -> Bool {
//        switch mode {
//        case .all: return index % 5 == 0
//        case .hoursOnly: return true
//        case .none: return false
//        }
        mode == .none ? false : index % 5 == 0
    }
    
    func width(for index: Int) -> CGFloat {
        mode == .none ? 0 : (isHour(index) ? 2 : 1)
    }
    
    func height(for index: Int) -> CGFloat {
        isHour(index) ? Self.hourScale : Self.minuteScale
    }
    
    func rotation(for index: Int) -> Angle {
        guard mode != .none else { return Angle(degrees: 0) }
        return Angle(degrees: Double(index) * 360 / Double(count))
    }
}
