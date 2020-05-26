//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by SK Ruban on 12/4/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var text: String
    var body: some View{
        
    Image(text)
        .renderingMode(.original)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    }
}


struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var chosenFlag = 0
    @State private var opacityAmount = 1.0
    @State private var animationAmount = 0.0
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30){
                VStack{
                    Text("Tap the flag of:")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0..<3){ number in
                    Button(action:{
                        self.flagTapped(number)
                        self.chosenFlag = number
                    }) {
                        FlagImage(text: self.countries[number])
                            .opacity(number != self.correctAnswer ? self.opacityAmount : 1.0)
                            .rotation3DEffect(.degrees(number == self.correctAnswer ? self.animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                            
                    }
                }
                Text("Your score is \(self.userScore)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                Spacer()
            }
        } .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")){
                self.askQuestion() })
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong thats the flag of \(countries[number])"
        }
        
        opacityAmount = 0.2
        
        withAnimation{
            animationAmount += 360
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        opacityAmount = 1.0
    
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
