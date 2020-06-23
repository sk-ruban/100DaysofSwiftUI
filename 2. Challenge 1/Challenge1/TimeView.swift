//
//  TimeView.swift
//  Challenge1
//
//  Created by SK Ruban on 23/6/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

struct TimeView: View {
    @State var time = ""
    @State var selectedUnitsIn = 0
    @State var selectedUnitsOut = 0
    var timeUnits = ["sec", "min", "hr", "days", "years"]
    
    var outputTime : Double {
        let inputTime = Double(time) ?? 0
        var inSecondsTime = Double(0)
        var finalTime = Double(0)
        
        switch selectedUnitsIn {
        case 1:
            inSecondsTime = inputTime * 60
        case 2:
            inSecondsTime = inputTime * (60 * 60)
        case 3:
            inSecondsTime = inputTime * (60 * 60 * 24)
        case 4:
            inSecondsTime = inputTime * (60 * 60 * 24 * 365)
        default:
            inSecondsTime = inputTime
        }
        
        switch selectedUnitsOut {
        case 1:
            finalTime = inSecondsTime / 60
        case 2:
            finalTime = inSecondsTime / (60 * 60)
        case 3:
            finalTime = inSecondsTime / (60 * 60 * 24)
        case 4:
            finalTime = inSecondsTime / (60 * 60 * 24 * 365)
        default:
            finalTime = inSecondsTime
        }
        
        return finalTime
    }
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Input the Time and Units")){
                    TextField("Amount", text: $time)
                    Picker("select", selection: $selectedUnitsIn){
                        ForEach(0 ..< timeUnits.count){
                            Text(self.timeUnits[$0])
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted Time")){
                    Text("\(outputTime.removeZerosFromEnd())")
                    Picker("select", selection: $selectedUnitsOut){
                        ForEach(0 ..< timeUnits.count){
                            Text(self.timeUnits[$0])
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .padding(.top,50)
            .navigationBarTitle(Text("⏱ Time"))
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
