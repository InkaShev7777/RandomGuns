//
//  User.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import Foundation

class User: ObservableObject, Identifiable {
    let id: String
    let name: String
    var startPoint: Int
    var positionBoolet: Int
    var positionNow: Int
    var countOfShoot: Int
    var isLive: Bool
    
    init(name: String) {
        self.id = UUID().uuidString
        self.isLive = true
        self.name = name
        self.positionBoolet = Int.random(in: 1...6)
        self.startPoint = Int.random(in: 1...6)
        self.positionNow = startPoint
        self.countOfShoot = 0
    }
}
