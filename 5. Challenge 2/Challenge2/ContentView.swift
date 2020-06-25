//
//  ContentView.swift
//  Challenge2
//
//  Created by SK Ruban on 19/4/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

let moves = ["🗿", "📰", "✂️"]
let states = ["WIN","LOSE"]

// Game chooses a random move
var appRandom = Int.random(in: 0...2)
// Game prompts user to either win/lose
var win = Int.random(in: 0...1)
// What the user selects
var userChoice = 0

private var scoreTitle = ""

struct ButtonView : View {
    var text: String
    var struct1 = ContentView()
    var type: Int {
        switch text{
            case "🗿":
                userChoice = 0
                return 0
            case "📰":
                userChoice = 1
                return 1
            default:
                userChoice = 2
                return 2
        }
    }
    
    var body: some View{
        ZStack{
            Circle()
                .fill(Color.red)
                .frame(width: 70, height: 70)
            Button(moves[type]){
                self.struct1.appTurn()
                self.struct1.nextQn()
                print("lol")
            }
            .font(.largeTitle)
        }
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var userScore = 0
    @State private var noOfTurns = 0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 50){

                Text("Score: \(userScore)/\(noOfTurns)")
            
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.yellow,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 280, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                
                    VStack(spacing: 10){
                        Text("Computer has chosen")
                        Text("\(moves[appRandom])")
                            .font(.system(size: 80))
                        
                        Text("and it wants you to")
                        Text("\(states[win])")
                            .font(.headline)
                            .fontWeight(.black)
                    }
                }
            
                HStack(spacing: 50){
                    Button("🗿"){
                        userChoice = 0
                        self.appTurn()
                        self.nextQn()
                    }
                    Button("📰"){
                        userChoice = 1
                        self.appTurn()
                        self.nextQn()
                    }
                    Button("✂️"){
                        userChoice = 2
                        self.appTurn()
                        self.nextQn()
                    }
                    ButtonView(text:"✂️")
                    
                }
                .font(.largeTitle)
                
                Spacer()
            }
            .navigationBarTitle(Text("Rock Paper Scissors"), displayMode: .automatic)
        } .alert(isPresented: $showingScore) {
                    Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")){
                            self.reset()
                            self.nextQn()
                        })
        }
    }
    
    func appTurn(){
        if win == 0 {
            if appRandom < 2 {
                if userChoice - appRandom == 1{
                    userScore += 1
                }
            }
            if appRandom == 2 {
                if appRandom - userChoice == 2{
                    userScore += 1
                }
            }
        } else if win == 1 {
            if userChoice < 2 {
                if appRandom - userChoice == 1 {
                    userScore += 1
                }
            }
            if userChoice == 2 {
                if userChoice - appRandom == 2{
                    userScore += 1
                }
            }
        }
        
        noOfTurns += 1
        if noOfTurns == 10{
            showingScore = true
            }
        }
    
    func nextQn(){
        appRandom = Int.random(in: 0...2)
        win = Int.random(in: 0...1)
    }
        
    func reset(){
        userScore = 0
        noOfTurns = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
