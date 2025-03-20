//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Manan Juneja on 2025-02-12.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
//            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.green)
            .clipShape(.rect(cornerRadius: 10.0))
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

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
                .titleStyle()
                .watermarked(with: "Manan")
            Text("This is MJ")
            CapsuleText(text: "This is capsule text")
                .foregroundStyle(.white)
            CapsuleText(text: "This is another one")
                .foregroundStyle(.yellow)
        }
        .font(.title) // environment var
        
        Button("Hello World") {
            useRedText.toggle()
        }
        .frame(width: 200, height: 200)
        .background(useRedText ? .red : .black) // ternary ops
        
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

#Preview {
    ContentView()
}
