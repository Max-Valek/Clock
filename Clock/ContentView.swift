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
            Circle()
                .fill(.clear)
                .frame(maxWidth: 350)
            
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
