//
//  VolumeView.swift
//  Challenge1
//
//  Created by SK Ruban on 23/6/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

struct VolumeView: View {
    @State var volume = ""
    @State var selectedUnitsIn = 0
    @State var selectedUnitsOut = 0
    var volumeUnits = ["mL", "L", "cups", "pints", "gallons"]
    

    var outputTime : Double {
        let inputVolume = Double(volume) ?? 0
        var inmlVolume = Double(0)
        var finalVolume = Double(0)
        
        switch selectedUnitsIn {
        case 1:
            inmlVolume = inputVolume / 1000
        case 2:
            inmlVolume = inputVolume * 236.588
        case 3:
            inmlVolume = inputVolume * 473.176
        case 4:
            inmlVolume = inputVolume * 4546.09
        default:
            inmlVolume = inputVolume
        }
        
        switch selectedUnitsOut {
        case 1:
            finalVolume = inmlVolume * 1000
        case 2:
            finalVolume = inmlVolume / 236.588
        case 3:
            finalVolume = inmlVolume / 473.176
        case 4:
            finalVolume = inmlVolume / 4546.09
        default:
            finalVolume = inmlVolume
        }
        
        return finalVolume
    }
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Input the Volume and Units")){
                    TextField("Amount", text: $volume)
                    Picker("select", selection: $selectedUnitsIn){
                        ForEach(0 ..< volumeUnits.count){
                            Text(self.volumeUnits[$0])
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted Volume")){
                    Text("\(outputTime.removeZerosFromEnd())")
                    Picker("select", selection: $selectedUnitsOut){
                        ForEach(0 ..< volumeUnits.count){
                            Text(self.volumeUnits[$0])
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .padding(.top,50)
            .navigationBarTitle(Text("📦 Volume"))
        }
    }

}

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}

