//
//  ContentView.swift
//  Moonshot
//
//  Created by Anton Priakhin on 14.01.2022.
//

import SwiftUI

struct ContentView: View {
    enum StyleType {
        case grid
        case list
    }
    
    @State private var styleType: StyleType = .grid
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let grid = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let list = [
        GridItem(.adaptive(minimum: .infinity))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: styleType == .grid ? grid : list) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            if styleType == .grid {
                                MissionItemStyleGridView(mission: mission)
                            } else {
                                MissionItemStyleListView(mission: mission)
                            }
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    styleType = styleType == .grid ? .list : .grid
                } label: {
                    Image(systemName: styleType == .grid ? "rectangle.grid.1x2.fill" : "square.grid.2x2.fill")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
