//
//  GoFishViewController.swift
//  Card Game Suite
//
//  Created by George Gikas on 7/13/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import UIKit

class GoFishViewController: UIViewController {
    
    
    ///IBOutlets for each image in the maximum case
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
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var cardsRemainingLabel: UILabel!
    @IBOutlet weak var middleDeckLabel: UILabel!
    @IBOutlet weak var yourBook1: UILabel!
    @IBOutlet weak var yourBook2: UILabel!
    @IBOutlet weak var yourBook3: UILabel!
    @IBOutlet weak var yourBook4: UILabel!
    @IBOutlet weak var yourBook5: UILabel!
    @IBOutlet weak var yourBook6: UILabel!
    @IBOutlet weak var yourBook7: UILabel!
    @IBOutlet weak var yourBook8: UILabel!
    @IBOutlet weak var yourBook9: UILabel!
    @IBOutlet weak var yourBook10: UILabel!
    @IBOutlet weak var yourBook11: UILabel!
    @IBOutlet weak var yourBook12: UILabel!
    @IBOutlet weak var yourBook13: UILabel!
    @IBOutlet weak var opponentBook1: UILabel!
    @IBOutlet weak var opponentBook2: UILabel!
    @IBOutlet weak var opponentBook3: UILabel!
    @IBOutlet weak var opponentBook4: UILabel!
    @IBOutlet weak var opponentBook5: UILabel!
    @IBOutlet weak var opponentBook6: UILabel!
    @IBOutlet weak var opponentBook7: UILabel!
    @IBOutlet weak var opponentBook8: UILabel!
    @IBOutlet weak var opponentBook9: UILabel!
    @IBOutlet weak var opponentBook10: UILabel!
    @IBOutlet weak var opponentBook11: UILabel!
    @IBOutlet weak var opponentBook12: UILabel!
    @IBOutlet weak var opponentBook13: UILabel!
    
    var cardTypes : [String] = []
    var viewArray : [UIImageView] = []
    var middleDeck : Deck = Deck()
    var numberReceived = 0
    var playerOneDeck : [Card] = []
    var playerTwoDeck : [Card] = []
    var aiDeck : [Card] = []
    var yourBookLabels : [UILabel] = []
    var opponentBookLabels : [UILabel] = []
    var randomNumber = 0
    var playersTurn = "Player One"
    var notPlayersTurn = "AI"
    var potentialBookNumber = 0
    var booksPlayerOne : [String] = []
    var booksPlayerTwo : [String] = []
    var booksAI : [String] = []
    var booksAppended : [String] = []
    var playerOneWin = false
    var playerTwoWin = false
    var aiWin = false
    var stolenCards = 0
    var stolenCardType = ""
    var totalCards : Int!
    var yourBooksDisplayed = 0
    var opponentBooksDisplayed = 0
    var firstRound = true
    
    /**
    Runs when the view is loaded. Initalizes the variables, performs the AI's turn if needed, and displays the players cards
    **/
    override func viewDidLoad() {
        super.viewDidLoad()
        viewArray = [cardView1, cardView2, cardView3, cardView4, cardView5, cardView6, cardView7, cardView8, cardView9, cardView10, cardView11, cardView12, cardView13, cardView14, cardView15, cardView16, cardView17, cardView18, cardView19, cardView20, cardView21, cardView22, cardView23, cardView24, cardView25, cardView26, cardView27, cardView28, cardView29, cardView30, cardView31, cardView32, cardView33, cardView34, cardView35, cardView36, cardView37, cardView38, cardView39]
        yourBookLabels = [yourBook1, yourBook2, yourBook3, yourBook4, yourBook5, yourBook6, yourBook7, yourBook8, yourBook9, yourBook10, yourBook11, yourBook12, yourBook13]
        opponentBookLabels = [opponentBook1, opponentBook2, opponentBook3, opponentBook4, opponentBook5, opponentBook6, opponentBook7, opponentBook8, opponentBook9, opponentBook10, opponentBook11, opponentBook12, opponentBook13]
        cardTypes = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
        if playerOneDeck.count == 0 && playerTwoDeck.count == 0 && aiDeck.count == 0 {
            getStartingCards()
        }
        if playersTurn == "AI" {
            aiTurn()
            checkForBooks()
            playersTurn = "Player One"
        }
        if numberReceived == 2 && playersTurn == "Player One" {
            notPlayersTurn = "Player Two"
        }
        if firstRound == true {
            for bookLabel in yourBookLabels {
                bookLabel.text = ""
            }
            for opponentBookLabel in opponentBookLabels {
                opponentBookLabel.text = ""
            }
            firstRound = false
        }
        checkForBooks()
        totalCards = playerOneDeck.count + playerTwoDeck.count + aiDeck.count + middleDeck.deck.count
        winConditions()
        if winConditions() == false {
            
        }
        playerLabel.text = playersTurn
        displayPlayer()
    }
    
    func display(playerDeck : [Card]) {
        let playerDeckCount = playerDeck.count - 1
        for number in 0...playerDeckCount {
            viewArray[number].image = playerDeck[number].image!
        }
    }
    
    /**
    Function that displays the player's turn
    **/
    func displayPlayer() {
        if numberReceived == 1 {
            display(playerOneDeck)
            yourBooksDisplayed = 0
            opponentBooksDisplayed = 0
            playerLabel.text = playersTurn
            middleDeckLabel.text = "Middle Deck: \(middleDeck.deck.count) Cards"
            cardsRemainingLabel.text = "Total: \(totalCards) Cards"
            for(var i = 0; i < booksPlayerOne.count; i++){
                yourBookLabels[i].text = booksPlayerOne[i]
            }
            for(var i = 0; i < booksAI.count; i++){
                opponentBookLabels[i].text = booksAI[i]
            }
        }
        if numberReceived == 2 {
            yourBooksDisplayed = 0
            opponentBooksDisplayed = 0
            playerLabel.text = playersTurn
            middleDeckLabel.text = "Middle Deck: \(middleDeck.deck.count) Cards"
            cardsRemainingLabel.text = "Total: \(totalCards) Cards"
            if playersTurn == "Player One" {
                display(playerOneDeck)
                for(var i = 0; i < booksPlayerOne.count; i++){
                    yourBookLabels[i].text = booksPlayerOne[i]
                }
                for(var i = 0; i < booksPlayerTwo.count; i++){
                    opponentBookLabels[i].text = booksPlayerTwo[i]
                }
            }
            else {
                display(playerTwoDeck)
                for(var i = 0; i < booksPlayerTwo.count; i++){
                    yourBookLabels[i].text = booksPlayerTwo[i]
                }
                for(var i = 0; i < booksPlayerOne.count; i++){
                    opponentBookLabels[i].text = booksPlayerOne[i]
                }
            }
        }
    }
    
    /**
    Helper function that checks if a match of four has been found
    **/
    func checker(cardType : String, playerDeck : [Card], booksCollection : [String]) {
        potentialBookNumber = 0
        for card in playerDeck {
            if card.name == "\(cardType)" {
                potentialBookNumber++
            }
        }
        if potentialBookNumber == 4 {
            booksAppended.append("\(cardType)s")
            var cardToBeRemoved = 0
            for card in playerDeck {
                if card.name == cardType {
                    if playersTurn == "Player One" {
                        playerOneDeck.removeAtIndex(cardToBeRemoved)
                        cardToBeRemoved--
                    }
                    else if playersTurn == "Player Two" {
                        playerTwoDeck.removeAtIndex(cardToBeRemoved)
                        cardToBeRemoved--
                    }
                    else if playersTurn == "AI" {
                        aiDeck.removeAtIndex(cardToBeRemoved)
                        cardToBeRemoved--
                    }
                }
                cardToBeRemoved++
            }
        }
    }
    
    /**
    Helper function that checks all the possibilities for a book
    **/
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
    
    /**
    Helper function that checks for all possible books for all the players and AI if applicable
    **/
    func checkForBooks() {
        if playersTurn == "Player One" {
            checkAllTypes(playerOneDeck, booksCollection: booksPlayerOne)
            if booksAppended.count != 0 {
                booksPlayerOne = booksPlayerOne + booksAppended
            }
            booksAppended = []
        }
        if playersTurn == "Player Two" {
            checkAllTypes(playerTwoDeck, booksCollection: booksPlayerTwo)
            if booksAppended.count != 0 {
                booksPlayerTwo = booksPlayerTwo + booksAppended
            }
            booksAppended = []
        }
        if playersTurn == "AI" {
            checkAllTypes(aiDeck, booksCollection: booksAI)
            if booksAppended.count != 0 {
                booksAI = booksAI + booksAppended
            }
            booksAppended = []
        }
    }
    
    /**s
    Function that appends randomly chosen cards from the middle deck to each player
    **/
    func getStartingCards() {
        if numberReceived == 1 {
            randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
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
    
    /**
    Function that performs the AI's turn
    **/
    func aiTurn() {
        if playerOneWin == false && aiWin == false {
            let randomNumber = Int(arc4random_uniform(UInt32(13)))
            var removalNumber = 0
            stolenCardType = cardTypes[randomNumber]
            for card in playerOneDeck {
                if card.name == cardTypes[randomNumber] {
                    aiDeck.append(card)
                    playerOneDeck.removeAtIndex(removalNumber)
                    stolenCards++
                    removalNumber--
                }
                removalNumber++
            }
            if stolenCards == 0 {
                let randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
                if middleDeck.deck.count != 0 {
                    let randomCard : Card = middleDeck.deck[randomNumber]
                    aiDeck.append(randomCard)
                    middleDeck.deck.removeAtIndex(randomNumber)
                }
            }
            let aiActionController = UIAlertController(title: "AI's Turn", message: "The AI has taken it's turn. It asked you for a \(stolenCardType). It took \(stolenCards) \(stolenCardType)(s).", preferredStyle: UIAlertControllerStyle.Alert)
            let aiAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                self.notPlayersTurn = "AI"
            })
            aiActionController.addAction(aiAlertAction)
            self.presentViewController(aiActionController, animated: true, completion: nil)
        }
    }
    
    /**
    Helper function that returns all cards to the middle Deck, and removes all Books and Cards from each player
    **/
    func resetGame() {
        playerOneDeck = []
        playerTwoDeck = []
        aiDeck = []
        booksPlayerOne = []
        booksPlayerTwo = []
        booksAI = []
        middleDeck = Deck()
        firstRound = true
    }
    
    /**
    Function that checks if there is a winner, resets the game, and segues back to the main menu on the completion of the game
    **/
    func winConditions() -> Bool {
        if numberReceived == 1 {
            if totalCards == 0 {
                if booksPlayerOne.count > booksAI.count {
                    let winningActionController = UIAlertController(title: "You Won!", message: "You have won the game against the AI!", preferredStyle: UIAlertControllerStyle.Alert)
                    let winningAlertAction = UIAlertAction(title: "Return to Main Menu", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                        self.resetGame()
                        self.performSegueWithIdentifier("return2MMSegue", sender: self)
                    })
                    winningActionController.addAction(winningAlertAction)
                    self.presentViewController(winningActionController, animated: true, completion: nil)
                    return true
                }
                else if booksAI.count > booksPlayerOne.count {
                    let winningActionController = UIAlertController(title: "You Lost!", message: "You have lost the game to the AI!", preferredStyle: UIAlertControllerStyle.Alert)
                    let winningAlertAction = UIAlertAction(title: "Return to Main Menu", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                        self.resetGame()
                        self.performSegueWithIdentifier("return2MMSegue", sender: self)
                    })
                    winningActionController.addAction(winningAlertAction)
                    self.presentViewController(winningActionController, animated: true, completion: nil)
                    return true
                }
            }
        }
        else if numberReceived == 2 {
            if totalCards == 0 {
                if booksPlayerOne.count > booksPlayerTwo.count {
                    let winningActionController = UIAlertController(title: "You Won!", message: "You have won the game against Player Two!", preferredStyle: UIAlertControllerStyle.Alert)
                    let winningAlertAction = UIAlertAction(title: "Return to Main Menu", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                        self.resetGame()
                        self.performSegueWithIdentifier("return2MMSegue", sender: self)
                    })
                    winningActionController.addAction(winningAlertAction)
                    self.presentViewController(winningActionController, animated: true, completion: nil)
                    return true
                }
                else if booksPlayerTwo.count > booksPlayerOne.count {
                    let winningActionController = UIAlertController(title: "You Won!", message: "You have won the game against Player One!", preferredStyle: UIAlertControllerStyle.Alert)
                    let winningAlertAction = UIAlertAction(title: "Return to Main Menu", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                        self.resetGame()
                        self.performSegueWithIdentifier("return2MMSegue", sender: self)
                    })
                    winningActionController.addAction(winningAlertAction)
                    self.presentViewController(winningActionController, animated: true, completion: nil)
                    return true
                }
            }
        }
        return false
    }
    
    /**
    Function that transfers variables before a segue occurs
    **/
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let next = segue.destinationViewController as! UINavigationController
        let top = next.topViewController as! GoFishModalViewController
        if numberReceived == 1 {
            top.playerOneDeck = playerOneDeck
            top.aiDeck = aiDeck
            top.middleDeck.deck = middleDeck.deck
            top.numberReceived = numberReceived
            top.player = playersTurn
            top.opposingPlayer = notPlayersTurn
            top.booksPlayerOne = booksPlayerOne
            top.booksPlayerTwo = booksPlayerTwo
            top.booksAI = booksAI
        }
        else if numberReceived == 2 {
            top.playerOneDeck = playerOneDeck
            top.playerTwoDeck = playerTwoDeck
            top.middleDeck = middleDeck
            top.numberReceived = numberReceived
            top.player = playersTurn
            top.opposingPlayer = notPlayersTurn
            top.booksPlayerOne = booksPlayerOne
            top.booksPlayerTwo = booksPlayerTwo
            top.booksAI = booksAI
        }
    }
}