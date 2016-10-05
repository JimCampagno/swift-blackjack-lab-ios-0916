//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Jim Campagno on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    
    let suit: String
    let rank: String
    let cardLabel: String
    var cardValue: UInt = 0
    
    var description: String {
        //TODO: Actually implement this computed property
        return "HELLO!"
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        cardLabel = suit + rank
        cardValue = determineCardValue(rank)
    }
    
    func determineCardValue(_ rank: String) -> UInt {
        switch rank {
        case "A":
            return 1
        case "K", "Q", "J":
            return 10
        default:
            return UInt(rank)!
        }
    }
    
    func generateCardValue() -> UInt {
        switch rank {
        case "A":
            return 1
        case "K", "Q", "J":
            return 10
        default:
            return UInt(rank)!
        }
    }
    
    static func validSuits() -> [String] {
        return ["♠︎", "♥︎", "♦︎", "♣︎"]
    }
    
    static func validRanks() -> [String] {
        return ["A", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
    }
    
}

func descriptionFor(cardArray cards: [Card]) -> String {
    var description: String = ""
    
    for (index, card) in cards.enumerated() {
        description += " \(card.cardLabel)"
        if (index + 1) % 13 == 0 { description += "\n" }
    }
    
    return description
}

