import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        ZStack {
//            VStack {
                Circle()
                    .fill(.ultraThinMaterial)
                    .background {
                        GeometryReader { proxy in
                            Path { path in
                                let center = CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2)
                                let radius = min(proxy.size.width, proxy.size.height) / 2.0

                                path.move(to: center)
                                path.addArc(center: center, radius: radius, startAngle: .degrees(0), endAngle: .degrees(270), clockwise: false)
                                path.closeSubpath()
                            }
                            .fill(
                                AngularGradient(
                                    colors: [.red, .orange, .yellow, .green],
                                    center: .center,
                                    startAngle: .degrees(0),
                                    endAngle: .degrees(270))
                            )
                            .rotationEffect(.degrees(-90))
                        }
                    }
                    //.blendMode(.screen)
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
