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
        
    Image(text).resizable()
        .renderingMode(.original)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .frame(width: 170.0, height: 100.0)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    }
}


struct ContentView: View {
    @State var countries = ["California","Greenland","Kazakhstan","Kiribati","Kosovo","Palau","Somalia","Turkmenistan","Uganda"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var userScore = 0
    @State private var chosenFlag = 0
    @State private var opacityAmount = 1.0
    @State private var animationAmount = 0.0
    

    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [.orange,.red]), center: .center, startRadius: 100, endRadius: 500)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30){
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.black)
                        .frame(width: 270, height: 90)
                    
                    VStack{
                        Text("Tap the flag of:")
                            .foregroundColor(.white)
                        
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                }
                
                ForEach(0..<3){ number in
                    Button(action:{
                        self.flagTapped(number)
                        self.chosenFlag = number
                    }) {
                        FlagImage(text: self.countries[number])
                            .opacity(number == self.correctAnswer ? 1 : self.opacityAmount)
                            .rotation3DEffect(.degrees(number == self.correctAnswer ? self.animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.black)
                        .frame(width: 300, height: 80)
                    
                    Text("Your score is \(self.userScore)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
        
                Spacer()
                
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Continue")){
                self.askQuestion() })
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct!👏"
            scoreMessage = "Your score is \(userScore)"
            userScore += 1
        } else {
            scoreTitle = "Wrong!👎"
            scoreMessage = "That's the flag of \(countries[number])"
        }
        withAnimation { animationAmount += 360 }
        opacityAmount = 0.2
        showingScore = true
    }
    
    func askQuestion() {
        self.opacityAmount = 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
