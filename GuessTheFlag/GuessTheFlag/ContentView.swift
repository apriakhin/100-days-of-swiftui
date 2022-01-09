//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Anton Priakhin on 27.12.2021.
//

import SwiftUI

struct FlagImage: View {
    let name: String

    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreCount = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingFinal = false
    @State private var roundCount = 8
    
    @State private var tappedFlag: Int?
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 300, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(name: countries[number])
                        }
                        .rotation3DEffect(.degrees(number == tappedFlag ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(tappedFlag != nil && number != tappedFlag ? 0.25 : 1)
                        .rotation3DEffect(.degrees(tappedFlag != nil && number != tappedFlag ? -360 : 0), axis: (x: 0, y: 1, z: 0))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(scoreCount)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(scoreCount)")
        }
        .alert(scoreTitle, isPresented: $showingFinal) {
            Button("Start over", action: reset)
        } message: {
            Text("Game over! Your score is \(scoreCount)")
        }
    }
    
    func flagTapped(_ number: Int) {
        withAnimation {
            tappedFlag = number
        }
        
        if number == correctAnswer {
            scoreTitle = "Correct!"
            scoreCount += 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            scoreCount -= scoreCount < 1 ? 0 : 1
        }
        
        roundCount -= 1
        
        if roundCount == 0 {
            showingFinal = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        tappedFlag = nil
    }
    
    func reset() {
        scoreCount = 0
        roundCount = 8
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
