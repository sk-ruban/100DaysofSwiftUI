//
//  ContentView.swift
//  BetterSleep
//
//  Created by SK Ruban on 16/4/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var wakeUp = defaultWakeTime
    @State var sleepAmount = 8.0
    @State private var coffeeAmount: Double = 1
    let coffee = [Int](0...15)
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section(header:
                    Text("When do you want to wake up?")
                        .font(.headline)
                ){
                
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                 Section(header:
                    Text("🛏 How much sleep do you want?")
                        .font(.headline)
                ){
                    
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25){
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section(header:
                    Text("☕️ Coffee Intake")
                        .font(.headline)
                ){
                    VStack {
                        HStack {
                            Image(systemName: "minus")
                            Slider(value: $coffeeAmount, in: 0...15, step: 1)
                                .accentColor(Color.orange)
                            Image(systemName: "plus")
                        }.foregroundColor(Color.orange)
                        
                        Text("\(coffeeAmount, specifier: "%g") ☕️")
                    }
                }
                        
            Text(alertTitle)
            Text(alertMessage)

            }
            .navigationBarTitle("BetterRest")
            .navigationBarItems(trailing:
                Button(action: calcBedTime){
                    Text("Calculate")
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            )
        }
    }
    
    func calcBedTime(){
        let model = SleepCalc()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            let formatter = DateFormatter()
            formatter.timeStyle = .long

            alertMessage = "\(sleepTime)"
            alertTitle = "Your ideal bedtime is…"

        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
        
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

