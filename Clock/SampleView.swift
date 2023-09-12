//
//  SampleView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

/// Sample implementation of the Clock component.
struct SampleView: View {
    
    private let clockSize: CGFloat = 250
    
    var body: some View {
        ZStack {
            background
            
            clockBackground
            
            AnalogClock(hands: [.hour, .minute, .second], mode: .none, hourColor: .mint, minuteColor: .green, secondColor: .purple)
                .padding(2)
                .background(clockBackground)
                .frame(maxWidth: self.clockSize)
            
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Components

extension SampleView {
    /// Platinum metallic background
    private var background: some View {
        LinearGradient(colors: [.white.opacity(0.7), .clear], startPoint: .topLeading, endPoint: .bottomLeading)
            .blur(radius: 16)
            .opacity(0.5)
            .background(.black)
            .ignoresSafeArea()
    }
    /// Clock background with shadows
    private var clockBackground: some View {
        Circle()
            .fill(
                LinearGradient(colors: [.secondary, .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.7)
            )
            .background(.black)
            .frame(maxWidth: self.clockSize)
            .clipShape(Circle())
            .shadow(color: .black, radius: 2, x: 0, y: 0)
            .shadow(color: .black, radius: 4, x: 10, y: 10)
            .shadow(color: .secondary.opacity(0.2), radius: 8, x: -6, y: -6)
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
            .preferredColorScheme(.dark)
    }
}
