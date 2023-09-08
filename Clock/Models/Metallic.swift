//
//  Metallic.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

enum Metallic {
    case gold
    case silver
    case platinum
    case bronze
    var colors: [Color] {
        switch self {
        case .gold: return [
            Color("gold1"), Color("gold2"), Color("gold3"),
            Color("gold3"), Color("gold4"), Color("gold1"),
        ]
            
        case .silver: return [
            Color("silver1"), Color("silver2"), Color("silver3"),
            Color("silver4"), Color("silver3"), Color("silver5"),
        ]
        
        case .platinum: return [
            Color("platinum1"), Color("platinum2"), Color("platinum1"),
            Color("platinum2"), Color("platinum3"), Color("platinum1"),
        ]
        
        case .bronze: return [
            Color("bronze1"), Color("bronze2"), Color("bronze3"),
            Color("bronze4"), Color("bronze1"), Color("bronze3"),
        ]}
        
    }
    
    var linearGradient: LinearGradient
    {
        return LinearGradient(
            gradient: Gradient(colors: self.colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
