//
//  TempView.swift
//  Challenge1
//
//  Created by SK Ruban on 23/6/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

struct TempView: View {
    @State var temp = ""
    @State var selectedUnitsIn = 0
    @State var selectedUnitsOut = 0
    var tempUnits = ["C°", "F°", "K°"]

    var outputTemp: Double {
        // Look at other Views for switch-case method
        let inputTemp = Double(temp) ?? 0
        var newTemp = Double(0)
        var finalTemp = Double(0)
        
        // Converts to C°
        if selectedUnitsIn == 0{
            newTemp = inputTemp
        } else if selectedUnitsIn == 1{
            newTemp = (inputTemp - 32) / 1.8
        } else {
            newTemp = inputTemp - 273.15
        }
        
        if selectedUnitsOut == 0{
            finalTemp = newTemp
        } else if selectedUnitsOut == 1{
            finalTemp = (newTemp * 1.8) + 32
        } else {
            finalTemp = newTemp + 273.15
        }
        
        return finalTemp
    }
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Input the Temperature and Units")) {
                    TextField("Amount", text: $temp)
                    Picker("select", selection: $selectedUnitsIn){
                        ForEach(0 ..< tempUnits.count){
                            Text(self.tempUnits[$0])
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted Temperature")){
                    Text("\(outputTemp.removeZerosFromEnd())")
                    Picker("select", selection: $selectedUnitsOut){
                        ForEach(0 ..< tempUnits.count){
                            Text(self.tempUnits[$0])
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .padding(.top,50)
            .navigationBarTitle(Text("🌡 Temperature"))
        }
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
