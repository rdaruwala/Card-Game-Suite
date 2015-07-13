//
//  GoFishViewController.swift
//  Card Game Suite
//
//  Created by George Gikas on 7/13/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import UIKit

class GoFishViewController: UIViewController {
    
    var middleDeck : Deck = Deck()
    var numberReceived:Int!
    var playerOneDeck : [Card] = []
    var playerTwoDeck : [Card] = []
    var aiDeck : [Card] = []
    var randomNumber = 0
    var numberofReceivedCards = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        if numberReceived == 1 {
            randomNumber = Int(arc4random_uniform(52))
            for _ in 1...7 {
                let appendedCard = middleDeck.deck[randomNumber]
                playerOneDeck.append(appendedCard)
                middleDeck.deck.removeAtIndex(randomNumber)
                randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
            }
        }
    }
}