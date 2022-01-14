//
//  MissionView.swift
//  Moonshot
//
//  Created by Anton Priakhin on 14.01.2022.
//

import SwiftUI

struct MissionView: View {    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.vertical)
                    
                    Text(mission.formattedLaunchDate)
                        .foregroundColor(.secondary)
                    
                    VStack(alignment: .leading) {
                        DividerView()
                        
                        TitleView(text: "Mission Highlights")
                        
                        Text(mission.description)
                        
                        DividerView()
                        
                        TitleView(text: "Crew")
                    }
                    .padding(.horizontal)
                    
                    CrewView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("mission.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
