//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Jim Campagno on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import GameKit

class Deck {
    
    private var dealtCards: [Card] = []
    private var undealtCards: [Card] = []
    var description: String { return createDeckDescription() }
    
    init() {
        for suit in Card.validSuits() {
            for rank in Card.validRanks() {
                let newCard = Card(suit: suit, rank: rank)
                undealtCards.append(newCard)
            }
        }
    }
    
    func drawCard() {
        guard !undealtCards.isEmpty else { return }
        let card = undealtCards.removeLast()
        dealtCards.append(card)
    }
    
    func shuffle() {
        while !dealtCards.isEmpty {
            let card = dealtCards.removeLast()
            undealtCards.append(card)
        }
        
        undealtCards.shuffle()
    }
    
    func createDeckDescription() -> String {
        guard !dealtCards.isEmpty else { return descriptionFor(cardArray: undealtCards) }
        
        var sentence: String = "Dealt Cards\n"
        sentence += dealtCards[0].cardLabel
        
        for card in dealtCards.dropFirst() {
            sentence += " \(card.cardLabel)"
        }
        
        sentence += "\n\n"
        
        sentence += "Undealt Cards\n"
        
        if !undealtCards.isEmpty { sentence += undealtCards[0].cardLabel }
        
        for card in undealtCards.dropFirst() {
            sentence += " \(card.cardLabel)"
        }
        
        return sentence
    }

}


extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (unshuffledCount, firstUnshuffled) in zip(stride(from: c, to: 1, by: -1), indices) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}
