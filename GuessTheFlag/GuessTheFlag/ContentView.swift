//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Manan Juneja on 2025-01-30.
//

import SwiftUI

struct ContentView: View {
//    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var tries = 8
    @State private var reset = false
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State var correctChoice = Int.random(in: 0...2)
    var body: some View {
//        HStack(spacing: 20) {
//            Text("Hello, world!")
//            Text("This is inside a Stack!")
//            VStack() {
//                Text("First")
//                Text("Second")
//                Text("Third")
//            }
//        }
//        ZStack() {
//            VStack(spacing: 20) {
//                LinearGradient(stops: [.init(color: Color.indigo, location: 0.45),.init(color: Color.blue, location: 0.55)], startPoint: .top, endPoint: .bottom)
//                RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
//                AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
                
                // Buttons
//                Button("Button 1") { }
//                    .buttonStyle(.bordered)
//                Button("Button 2", role: .destructive) { }
//                    .buttonStyle(.borderedProminent)
//                Button("Button 3") { }
//                    .buttonStyle(.borderedProminent)
//                    .tint(.mint)
//                Button("Button 4", role: .destructive) { }
//                    .buttonStyle(.borderedProminent)
//                Button {
//                    print("Edit button was tapped")
//                } label: {
////                    Image(systemName: "pencil")
//                    Text("Tap me!")
//                        .padding()
//                        .foregroundStyle(.white)
//                        .background(.red)
//                }
//                
//                Button("Show Alert") {
//                    showingAlert = true
//                }
//                .alert("Important Message", isPresented: $showingAlert) {
//                    Button("Delete", role: .destructive) {}
//                    Button("Cancel", role: .cancel) {}
//                } message: {
//                    Text("Please read this")
//                }
//
//            }
            
//
//            Color.red
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//            Text("This is my content")
//                .foregroundStyle(.secondary)
//                .padding(50)
////                .background(.red.gradient)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
//
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack() {
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack() {
                        Text("Tap the correct flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctChoice])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { num in
                        Button {
                            flagTapped(num)
                        } label: {
                            Image(countries[num])
                                .clipShape(.capsule)
                                .shadow(radius: 5.0)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20.0))
                
                Spacer()
                Spacer()
                Text("Score \(score)/8")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }.padding()
            
            
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                askQuestion()
            }
        } message: {
            Text("Your score is \(score)")
        }.alert(scoreTitle, isPresented: $reset) {
            Button("Restart Game") {
                resetGame()
            }
        } message: {
            Text("Your final score is \(score)/8")
        }
        
        

        
    }
    
    func flagTapped(_ num: Int) {
        tries -= 1
        if tries == 0 {
            reset = true
        }
        if num == correctChoice {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Incorrect, that's the flag of \(countries[num])"
        }
        
        showingScore = true
    }
    
    func resetGame() {
        showingScore = false
        score = 0
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctChoice = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
