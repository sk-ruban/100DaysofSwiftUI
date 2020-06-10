//
//  Prospect.swift
//  HotProspects
//
//  Created by SK Ruban on 10/6/20.
//  Copyright © 2020 SK Ruban. All rights reserved.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]

    init() {
        self.people = []
    }
}
