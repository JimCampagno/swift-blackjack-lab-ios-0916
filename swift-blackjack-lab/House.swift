//
//  House.swift
//  swift-blackjack-lab
//
//  Created by James Campagno on 10/4/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class House: Player {
    
    var mustHit: Bool { return handScore < 17 }
    
    override init(name: String, tokens: UInt = 1000) {
        super.init(name: name, tokens: tokens)        
    }

}
