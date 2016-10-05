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
        
        
        let newPlayer = Player(name: "Bilbo")
        print(newPlayer.tokens)
        
        let otherPlayer = Player(name: "Samwise", tokens: 999)
        print(otherPlayer.tokens)
        
        
        let housePerson = House(name: "Jessica", tokens: 1)
        let otherHousePerson = House(name: "JIMBO!!!")
        
        
        print(housePerson.tokens)
        print(otherHousePerson.tokens)
        
        
    }

   


}

