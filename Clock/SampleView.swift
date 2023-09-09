//
//  SampleView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// Sample implementation of the Clock component.
struct SampleView: View {
    
    private let clockSize: CGFloat = 350
    
    var body: some View {
        ZStack {
            metallicBackground
            
            clockBackground
            
            Clock(hands: [.hour, .minute, .second], mode: .hoursOnly) {
                Circle()
                    .fill(.red)
                    .frame(maxWidth: 20)
            }
            .frame(maxWidth: self.clockSize)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Components

extension SampleView {
    /// Platinum metallic background
    private var metallicBackground: some View {
        Metallic.platinum.linearGradient
            .blur(radius: 16)
            .opacity(0.5)
            .background(
                LinearGradient(
                    colors: [Metallic.silver.colors[0].opacity(0.7), .black],
                    startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .ignoresSafeArea()
    }
    /// Clock background with shadows
    private var clockBackground: some View {
        Circle()
            .fill(Metallic.silver.linearGradient.opacity(0.3))
            .background(.black)
            .blur(radius: 4)
            .frame(maxWidth: self.clockSize)
            .clipShape(Circle())
            .shadow(color: .black, radius: 4, x: 4, y: 4)
            .shadow(color: .secondary.opacity(0.5), radius: 2, x: -2, y: -2)
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
            //.environmentObject(ClockManager())
            .preferredColorScheme(.dark)
    }
}

// Metallic gradients
enum Metallic {
    
    case gold, silver, platinum, bronze
    
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
    
    var linearGradient: LinearGradient {
        return LinearGradient(
            gradient: Gradient(colors: self.colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
