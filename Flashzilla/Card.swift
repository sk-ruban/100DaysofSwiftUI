//
//  Card.swift
//  Flashzilla
//
//  Created by SK Ruban on 12/6/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import Foundation

struct Card {
    let prompt: String
    let answer: String

    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
