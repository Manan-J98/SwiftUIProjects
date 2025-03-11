//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Manan Juneja on 2025-02-12.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    let motto1 = Text("Hello Computer")
    let motto2 = Text("Hello Human")
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    } // swiftui won't apply viewbuilder automatically
    
    var spells1: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
        
    
    var spells2: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    var body: some View {
//        VStack {
//            Text("Hello, world!")
//                .padding()
//                .background(.red)
//                .padding()
//                .background(.blue)
//                .padding()
//                .background(.green)
//                .padding()
//                .background(.yellow)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.red)
        
        VStack {
            motto1
                .font(.largeTitle)// takes priority over environment vars
            Text("World")
            Text("This is MJ")
        }
        .font(.title) // environment var
        
        Button("Hello World") {
            useRedText.toggle()
        }
        .frame(width: 200, height: 200)
        .background(useRedText ? .red : .black) // ternary ops
        
    }
}

#Preview {
    ContentView()
}
