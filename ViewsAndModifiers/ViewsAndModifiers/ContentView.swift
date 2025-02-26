//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Manan Juneja on 2025-02-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        
//        Button("Hello World") {
//            
//        }
//        .frame(width: 200, height: 200)
//        .background(.red)
        
    }
}

#Preview {
    ContentView()
}
