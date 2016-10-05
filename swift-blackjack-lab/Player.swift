//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by James Campagno on 10/4/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    
    let name: String
    var tokens: UInt

    var cards: [Card] = []
    var stayed: Bool = false
    
    var mayHit: Bool { return determineIfPlayerCanHit() }
    var busted: Bool { return determineIfBusted() }
    var blackjack: Bool { return determineBlackjack() }
    var handScore: UInt { return calculateHandScore() }
    var description: String { return "Hello!" }

    init(name: String, tokens: UInt = 100) {
        self.name = name
        self.tokens = tokens
    }
    
    func canPlace(bet: UInt) -> Bool {
        return bet <= tokens
    }
    
    func didWin(_ bet: UInt) {
        tokens += bet
    }
    
    func didLose(_ bet: UInt) {
        tokens -= bet
        if tokens < 0 { tokens = 0 }
    }
    
}

// MARK: - Functions for Computed read-only properties
extension Player {
    
    func calculateHandScore() -> UInt {
        // TODO: What if we want to use two aces with the value 11!
        var score: UInt = 0
        var aces: [Card] = []
        
        for card in cards {
            if card.rank == "A" { aces.append(card) }
            score += card.cardValue
        }
        
        if !aces.isEmpty {
            let wouldBust = (score + 10) > 21
            if !wouldBust {
                score += 10
            }
        }
        
        return score
    }
    
    func determineBlackjack() -> Bool {
        guard cards.count == 2 else { return false }
        return handScore == 21
    }
    
    func determineIfBusted() -> Bool {
        return handScore > 21
    }
    
    func determineIfPlayerCanHit() -> Bool {
        return !busted && !blackjack && !stayed
    }
    
}


