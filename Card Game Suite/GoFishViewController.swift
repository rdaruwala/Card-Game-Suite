//
//  GoFishViewController.swift
//  Card Game Suite
//
//  Created by George Gikas on 7/13/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import UIKit

class GoFishViewController: UIViewController {
    
    @IBOutlet weak var cardView1: UIImageView!
    @IBOutlet weak var cardView2: UIImageView!
    @IBOutlet weak var cardView3: UIImageView!
    @IBOutlet weak var cardView4: UIImageView!
    @IBOutlet weak var cardView5: UIImageView!
    @IBOutlet weak var cardView6: UIImageView!
    @IBOutlet weak var cardView7: UIImageView!
    @IBOutlet weak var cardView8: UIImageView!
    @IBOutlet weak var cardView9: UIImageView!
    @IBOutlet weak var cardView10: UIImageView!
    @IBOutlet weak var cardView11: UIImageView!
    @IBOutlet weak var cardView12: UIImageView!
    @IBOutlet weak var cardView13: UIImageView!
    @IBOutlet weak var cardView14: UIImageView!
    @IBOutlet weak var cardView15: UIImageView!
    @IBOutlet weak var cardView16: UIImageView!
    @IBOutlet weak var cardView17: UIImageView!
    @IBOutlet weak var cardView18: UIImageView!
    @IBOutlet weak var cardView19: UIImageView!
    @IBOutlet weak var cardView20: UIImageView!
    @IBOutlet weak var cardView21: UIImageView!
    @IBOutlet weak var cardView22: UIImageView!
    @IBOutlet weak var cardView23: UIImageView!
    @IBOutlet weak var cardView24: UIImageView!
    @IBOutlet weak var cardView25: UIImageView!
    @IBOutlet weak var cardView26: UIImageView!
    @IBOutlet weak var cardView27: UIImageView!
    @IBOutlet weak var cardView28: UIImageView!
    @IBOutlet weak var cardView29: UIImageView!
    @IBOutlet weak var cardView30: UIImageView!
    @IBOutlet weak var cardView31: UIImageView!
    @IBOutlet weak var cardView32: UIImageView!
    @IBOutlet weak var cardView33: UIImageView!
    @IBOutlet weak var cardView34: UIImageView!
    @IBOutlet weak var cardView35: UIImageView!
    @IBOutlet weak var cardView36: UIImageView!
    @IBOutlet weak var cardView37: UIImageView!
    @IBOutlet weak var cardView38: UIImageView!
    @IBOutlet weak var cardView39: UIImageView!
    
    var viewArray : [UIImageView] = []
    var middleDeck : Deck = Deck()
    var numberReceived:Int!
    var playerOneDeck : [Card] = []
    var playerTwoDeck : [Card] = []
    var aiDeck : [Card] = []
    var randomNumber = 0
    var playersTurn = "Player One"
    var potentialBookNumber = 0
    var booksPlayerOne : [String] = []
    var booksPlayerTwo : [String] = []
    var booksAI : [String] = []
    var a : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewArray = [cardView1, cardView2, cardView3, cardView4, cardView5, cardView6, cardView7, cardView8, cardView9, cardView10, cardView11, cardView12, cardView13, cardView14, cardView15, cardView16, cardView17, cardView18, cardView19, cardView20, cardView21, cardView22, cardView23, cardView24, cardView25, cardView26, cardView27, cardView28, cardView29, cardView30, cardView31, cardView32, cardView33, cardView34, cardView35, cardView36, cardView37, cardView38, cardView39]
        getStartingCards()
        displayPlayer()
    }
    
    func display(playerDeck : [Card?]) {
        for number in 0...38 {
            if playerDeck[number] != nil {
                viewArray[number].image = playerDeck[number]!.image
            }
        }
    }
    
    func displayPlayer() {
        if numberReceived == 1 {
            if playersTurn == "Player One" {
                display(playerOneDeck)
                playersTurn = "AI"
            }
            else {
                playersTurn = "Player One"
            }
        }
        if numberReceived == 2 {
            if playersTurn == "Player One" {
                display(playerOneDeck)
                playersTurn = "Player Two"
            }
            else {
                display(playerTwoDeck)
                playersTurn = "Player One"
            }
        }
    }
    
    func checker(cardType : String, playerDeck : [Card], booksCollection : [String]) {
        potentialBookNumber = 0
        var a = booksCollection
        for card in playerDeck {
            if card.name == "\(cardType)" {
                potentialBookNumber++
            }
        }
        if potentialBookNumber == 4 {
            a.append("\(cardType)s")
        }
        potentialBookNumber = 0
    }
    
    func checkAllTypes(playerDeck : [Card], booksCollection : [String]) {
        checker("Ace", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("One", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("Two", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("Three", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("Four", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("Five", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("Six", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("Seven", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("Eight", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("Nine", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("Ten", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("Jack", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("Queen", playerDeck: playerDeck, booksCollection: booksCollection)
        checker("King", playerDeck: playerDeck, booksCollection: booksCollection)
    }
    
    func checkForBooks() {
        potentialBookNumber = 0
        if playersTurn == "Player One" {
            checkAllTypes(playerOneDeck, booksCollection: booksPlayerOne)
            booksPlayerOne = booksPlayerOne + a
        }
        if playersTurn == "Player Two" {
            checkAllTypes(playerTwoDeck, booksCollection: booksPlayerTwo)
            booksPlayerTwo = booksPlayerTwo + a
        }
        if playersTurn == "AI" {
            checkAllTypes(aiDeck, booksCollection: booksAI)
            booksAI = booksAI + a
        }
    }
    
    func getStartingCards() {
        if numberReceived == 1 {
            randomNumber = Int(arc4random_uniform(52))
            for _ in 1...7 {
                let appendedCard = middleDeck.deck[randomNumber]
                playerOneDeck.append(appendedCard)
                middleDeck.deck.removeAtIndex(randomNumber)
                randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
                let appendedAICard = middleDeck.deck[randomNumber]
                aiDeck.append(appendedAICard)
                middleDeck.deck.removeAtIndex(randomNumber)
                randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
            }
        }
        if numberReceived == 2 {
            for _ in 1...7 {
                let appendedCard = middleDeck.deck[randomNumber]
                playerOneDeck.append(appendedCard)
                middleDeck.deck.removeAtIndex(randomNumber)
                randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
                let appendedCardTwo = middleDeck.deck[randomNumber]
                playerTwoDeck.append(appendedCardTwo)
                middleDeck.deck.removeAtIndex(randomNumber)
                randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
            }
        }
    }
}