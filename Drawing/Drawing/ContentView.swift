//
//  ContentView.swift
//  Drawing
//
//  Created by Anton Priakhin on 08.03.2022.
//

import SwiftUI

struct Arrow: Shape {
    var lineWidth: Double
    
    var animatableData: Double {
         get { lineWidth }
         set { lineWidth = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        return path.strokedPath(.init(lineWidth: lineWidth))
    }
}

struct ContentView: View {
    @State private var lineWidth = 2.0
    
    var body: some View {
        Arrow(lineWidth: lineWidth)
            .frame(width: 100, height: 100)
            .onTapGesture {
                withAnimation {
                    lineWidth += 2.0
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
