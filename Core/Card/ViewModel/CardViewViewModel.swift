//
//  CardViewViewModel.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 15.11.2024.
//

import Foundation

class CardViewViewModel {
    @Published var cardTable: String = ""
    @Published var titleCradDisplay: String = ""
    static let shared = CardViewViewModel()
    
    private let listOfCard:[String] = ["queen", "king", "ace"]
    
    func randomCard() {
        guard let card = listOfCard.randomElement() else {
            return
        }
        cardTable = card
        
    }
}
