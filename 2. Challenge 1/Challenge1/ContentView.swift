//
//  ContentView.swift
//  Challenge1
//
//  Created by SK Ruban on 15/4/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}

struct ContentView: View {
    
    var body: some View {
        TabView{
            TempView()
            .tabItem {
                Image(systemName: "thermometer")
                Text("Temperature")
            }
            LengthView()
            .tabItem {
                Image(systemName: "rectangle.compress.vertical")
                Text("Length")
            }
            TimeView()
            .tabItem {
                Image(systemName: "timer")
                Text("Time")
            }
            VolumeView()
            .tabItem {
                Image(systemName: "cube.fill")
                Text("Volume")
            }
        }
    }
    
    init() {
      let navBarAppearance = UINavigationBar.appearance()
      navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
      navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
