//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Manan Juneja on 2025-01-30.
//

import SwiftUI

struct ContentView: View {
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
        ZStack() {
            VStack(spacing: 20) {
//                LinearGradient(stops: [.init(color: Color.indigo, location: 0.45),.init(color: Color.blue, location: 0.55)], startPoint: .top, endPoint: .bottom)
//                RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
//                AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
                
                // Buttons
                Button("Button 1") { }
                    .buttonStyle(.bordered)
                Button("Button 2", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
                Button("Button 3") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                Button("Button 4", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
                Button {
                    print("Edit button was tapped")
                } label: {
                    Image(systemName: "pencil")
                    Text("Tap me!")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                }

            }
            
//
//            Color.red
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//            Text("This is my content")
//                .foregroundStyle(.secondary)
//                .padding(50)
////                .background(.red.gradient)
//                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    ContentView()
}
