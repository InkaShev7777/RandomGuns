//
//  RandomPlayingCardManager.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import Foundation

final class RandomPlayingCardManager {
    @Published var cardTable: String = ""
    @Published var card = ""
    static let shared = RandomPlayingCardManager()
    
    private let listOfCard:[String] = ["queen", "king", "ace"]
    
    func randomCard() {
        guard let card = listOfCard.randomElement() else {
            return
        }
        cardTable = card
        
    }
}
