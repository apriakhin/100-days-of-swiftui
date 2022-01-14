//
//  MissionItemStyleListView.swift
//  Moonshot
//
//  Created by Anton Priakhin on 15.01.2022.
//

import SwiftUI

struct MissionItemStyleListView: View {
    let mission: Mission
    
    var body: some View {
        HStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .padding()
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.lightBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.lightBackground))
    }
}

struct MissionItemStyleListView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("mission.json")
    
    static var previews: some View {
        MissionItemStyleListView(mission: missions[0])
    }
}
