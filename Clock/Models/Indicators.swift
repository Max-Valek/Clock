//
//  Indicators.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

//enum IndicatorMode {
//    case all, hoursOnly, none
//    
//    static let hourScale: CGFloat = 0.05
//    static let minuteScale: CGFloat = 0.025
//}
//
//struct Indicators {
//    let mode: IndicatorMode
//    static let hourScale: CGFloat = 0.05
//    static let minuteScale: CGFloat = 0.025
//    
//    init(mode: IndicatorMode = .all) {
//        self.mode = mode
//    }
//    
//    var count: Int { mode == .none ? 0 : 60 }
//    
//    func isHour(_ index: Int) -> Bool { mode == .none ? false : index % 5 == 0 }
//    
//    func width(for index: Int) -> CGFloat { mode == .none ? 0 : (isHour(index) ? 3 : 2) }
//    
//    func height(for index: Int) -> CGFloat { isHour(index) ? Self.hourScale : Self.minuteScale }
//    
//    func rotation(for index: Int) -> Angle {
//        Angle(degrees: mode == .none ? 0 : Double(index) * 360 / Double(count))
//    }
//}
