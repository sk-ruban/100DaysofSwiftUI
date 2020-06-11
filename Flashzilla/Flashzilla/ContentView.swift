//
//  ContentView.swift
//  Flashzilla
//
//  Created by SK Ruban on 11/6/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

struct ContentView: View {
 

    var body: some View {
        Text("Hello, World!")
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            print("Moving to the background!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
