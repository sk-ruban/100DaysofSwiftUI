//
//  ContentView.swift
//  ViewModifiers
//
//  Created by SK Ruban on 24/6/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

struct BlueTitle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.blue)
            .font(.largeTitle)
            .font(Font.title.weight(.bold))
    }
}

extension View {
    func blueTitle() -> some View {
        self.modifier(BlueTitle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .blueTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

