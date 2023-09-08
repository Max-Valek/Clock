//
//  ContentView.swift
//  Clock
//
//  Created by Max Valek on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Metallic.platinum.linearGradient
                .blur(radius: 16)
                .opacity(0.5)
                .background(
                    LinearGradient(
                        colors: [Metallic.silver.colors[0].opacity(0.7), .black],
                        startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .ignoresSafeArea()
            
            Circle()
                .fill(Metallic.silver.linearGradient.opacity(0.3))
                .background(.black)
                .blur(radius: 1)
                .overlay(
                    Circle()
                        .stroke(Metallic.gold.linearGradient, lineWidth: 3)
                )
                .frame(maxWidth: 350)
                .clipShape(Circle())
                .shadow(color: .black, radius: 4, x: 4, y: 4)
                .shadow(color: .secondary.opacity(0.3), radius: 2, x: -2, y: -2)
            
            ClockView()
                .frame(maxWidth: 350)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


