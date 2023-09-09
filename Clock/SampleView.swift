//
//  SampleView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

struct SampleView: View {
    
    private let clockSize: CGFloat = 350
    
    var body: some View {
        ZStack {
            metallicBackground
            
            clockBackground
            
            ClockView()
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


