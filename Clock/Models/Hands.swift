//
//  Hands.swift
//  Clock
//
//  Created by Max Valek on 9/9/23.
//

import SwiftUI

struct ClockHandConfiguration {
    let color: Color
    let lengthScale: CGFloat
    let thickness: CGFloat
}

struct Hands {
    enum ClockHandType: Int, CaseIterable {
        case hour, minute, second
    }
    
    let primaryColor: Color
    let secondaryColor: Color
    let hasSmallIndicators: Bool
    let selectedHandTypes: [ClockHandType] // Allow the user to specify selected hand types
    
    init(
        primaryColor: Color = .primary,
        secondaryColor: Color = .red,
        hasSmallIndicators: Bool = true,
        selectedHandTypes: [ClockHandType] = [.hour, .minute, .second]
    ) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.hasSmallIndicators = hasSmallIndicators
        self.selectedHandTypes = selectedHandTypes
    }
    
    func configuration(for hand: ClockHandType) -> ClockHandConfiguration {
        switch hand {
        case .hour:
            return ClockHandConfiguration(color: primaryColor, lengthScale: 0.65, thickness: 8)
        case .minute:
            return ClockHandConfiguration(color: primaryColor, lengthScale: 0.85, thickness: 4)
        case .second:
            return ClockHandConfiguration(color: secondaryColor, lengthScale: 0.85, thickness: 2)
        }
    }
}

struct NewHandView: View {
    let hands = Hands(selectedHandTypes: [.hour, .minute, .second]) // Customize selected hand types

    let maxLength: CGFloat = 100

    var body: some View {
        VStack {
            ForEach(hands.selectedHandTypes, id: \.rawValue) { hand in
                if let config = hands.configuration(for: hand) {
                    Capsule()
                        .fill(config.color)
                        .frame(width: config.lengthScale * maxLength, height: config.thickness)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct NewHandView_Previews: PreviewProvider {

    static var previews: some View {
        NewHandView()
            .preferredColorScheme(.dark)
    }
}
