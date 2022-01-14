//
//  MissionItemStyleGridView.swift
//  Moonshot
//
//  Created by Anton Priakhin on 15.01.2022.
//

import SwiftUI

struct MissionItemStyleGridView: View {
    let mission: Mission
    
    var body: some View {
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.lightBackground))
    }
}

struct MissionItemStyleGridView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("mission.json")
    
    static var previews: some View {
        MissionItemStyleGridView(mission: missions[0])
    }
}
