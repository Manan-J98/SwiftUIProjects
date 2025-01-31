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
                LinearGradient(stops: [.init(color: Color.indigo, location: 0.45),.init(color: Color.blue, location: 0.55)], startPoint: .top, endPoint: .bottom)
                RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
                AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)

            }
            
//
//            Color.red
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            Text("This is my content")
                .foregroundStyle(.secondary)
                .padding(50)
//                .background(.red.gradient)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    ContentView()
}
