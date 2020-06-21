//
//  ContentView.swift
//  WeSplit
//
//  Created by SK Ruban on 21/6/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var amount = ""
    @State var people = 2
    @State var tipPercentage = 0
    
    let tipPercentages = [0,10,15,20,25]
    
    var totalPerPax: Double {
        let peopleCount = Double(people)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(amount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPax = grandTotal / peopleCount
        
        return amountPerPax
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $amount)
                    Picker("Number of People", selection: $people){
                        ForEach(0..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){ value in
                            Text("\(self.tipPercentages[value])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("$\(totalPerPax, specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle(Text("WeSplit"))
            .foregroundColor(Color.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


