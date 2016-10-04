//
//  ViewController.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let jimsCard = Card(suit: "♣︎", rank: "K")
        print(jimsCard.cardValue)
        print(jimsCard.cardLabel)
        print(jimsCard.description)
        
        
        
        
    }

   


}

