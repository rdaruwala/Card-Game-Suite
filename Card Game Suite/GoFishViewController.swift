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
    var playersTurn = "Player One"
    var potentialBookNumber = 0
    var booksPlayerOne : [String] = []
    var booksPlayerTwo : [String] = []
    var booksAI : [String] = []
    var a : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStartingCards()
        displayPlayer()
    }
    
    func displayPlayer() {
        if numberReceived == 1 {
            if playersTurn == "Player One" {
                playersTurn = "AI"
            }
            else {
                playersTurn = "Player One"
            }
        }
        if numberReceived == 2 {
            if playersTurn == "Player One" {
                playersTurn = "Player Two"
            }
            else {
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