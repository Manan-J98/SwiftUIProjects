//
//  ContentView.swift
//  WeSplit
//
//  Created by Manan Juneja on 2025-01-23.
//

import SwiftUI

struct ContentView: View {
//    @State private var tapCount = 0 // State allows property to be store in a special place where it cane be modified
//    @State private var name: String = ""
//    let students = ["Harry", "Hermione", "Ron"]
//    @State private var selectedStudent = "Harry"
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount/100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grossAmount: Double {
        return checkAmount + (checkAmount/100 * Double(tipPercentage))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2...99, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much tip do you want to leave?") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("total amount with tip") {
                    Text(grossAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                    
                }
            }
        }
        

//        NavigationStack {
//            Form {
//                Section {
//                    TextField("Enter your name", text: $name) // $ is used for 2 way binding, tells swift to read and write back (listeners ?)
//                    Text("Your name is \(name)")
//                    Picker("Select your student", selection: $selectedStudent) {
//                        ForEach(students, id: \.self) {
//                            Text($0)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Swift UI")
//            .navigationBarTitleDisplayMode(.inline)
//        }
        
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }
        
    }
}

#Preview {
    ContentView()
}

struct Calculate {
    func calcluateTip(billAmount: Double, tip: Double) -> Double? {
        guard billAmount >= 0 && tip >= 0 else {
            return nil
        }
        let tipPercentage = tip / 100
        return billAmount * tipPercentage
    }
}
