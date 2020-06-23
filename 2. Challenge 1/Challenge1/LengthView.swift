//
//  LengthView.swift
//  Challenge1
//
//  Created by SK Ruban on 23/6/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

// Length conversion: users choose meters, kilometers, feet, yards, or miles.
struct LengthView: View {
    @State var length = ""
    @State var selectedUnitsIn = 0
    @State var selectedUnitsOut = 0
    var lengthUnits = ["m", "km", "ft","yd","mi"]
    
    var outputLength : Double {
        let inputLength = Double(length) ?? 0
        var inMetersLength = Double(0) 
        var finalLength = Double(0)
        
        switch selectedUnitsIn {
        case 1:
            inMetersLength = inputLength * 1000
        case 2:
            inMetersLength = inputLength / 3.2808
        case 3:
            inMetersLength = inputLength / 1.0936
        case 4:
            inMetersLength = inputLength * 1609.34
        default:
            inMetersLength = inputLength
        }
        
        switch selectedUnitsOut {
        case 1:
            finalLength = inMetersLength / 1000
        case 2:
            finalLength = inMetersLength * 3.2808
        case 3:
            finalLength = inMetersLength * 1.0936
        case 4:
            finalLength = inMetersLength / 1609.344
        default:
            finalLength = inMetersLength
        }
        
        return finalLength
    }
    
    var body: some View {
        NavigationView {
            List{
                Section(header: Text("Input the Length and Units")){
                    TextField("Amount", text: $length)
                    Picker("select", selection: $selectedUnitsIn){
                        ForEach(0 ..< lengthUnits.count){
                            Text(self.lengthUnits[$0])
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted Length")){
                    Text("\(outputLength.removeZerosFromEnd())")
                    Picker("select", selection: $selectedUnitsOut){
                        ForEach(0 ..< lengthUnits.count){
                            Text(self.lengthUnits[$0])
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                }
                
                
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .padding(.top,50)
            .navigationBarTitle(Text("📏 Length"))
        }
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}
