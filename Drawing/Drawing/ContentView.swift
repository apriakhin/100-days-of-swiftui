//
//  ContentView.swift
//  Drawing
//
//  Created by Anton Priakhin on 08.03.2022.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    var startPointGradient: UnitPoint = .top
    var endPointGradient: UnitPoint = .bottom
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: startPointGradient,
                            endPoint: endPointGradient
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
     }
 }

struct ContentView: View {
    @State private var colorCycle = 0.0
    @State private var startPointGradient: UnitPoint = .top
    @State private var endPointGradient: UnitPoint = .bottom
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(
                amount: colorCycle,
                startPointGradient: startPointGradient,
                endPointGradient: endPointGradient
            )
            .frame(width: 300, height: 300)

            Group {
                Text("Color Cycle")
                Slider(value: $colorCycle)
                
                Text("Start Point Gradient X")
                Slider(value: $startPointGradient.x)
                
                Text("Start Point Gradient Y")
                Slider(value: $startPointGradient.y)
                
                Text("End Point Gradient X")
                Slider(value: $endPointGradient.x)
                
                Text("End Point Gradient Y")
                Slider(value: $endPointGradient.y)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
