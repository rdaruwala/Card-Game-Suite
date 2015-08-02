//
//  GoFishModalViewController.swift
//  Card Game Suite
//
//  Created by George Gikas on 7/14/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import UIKit

class GoFishModalViewController: UIViewController {
    
    @IBOutlet weak var askingLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var ace: UIImageView!
    @IBOutlet weak var two: UIImageView!
    @IBOutlet weak var three: UIImageView!
    @IBOutlet weak var four: UIImageView!
    @IBOutlet weak var five: UIImageView!
    @IBOutlet weak var six: UIImageView!
    @IBOutlet weak var seven: UIImageView!
    @IBOutlet weak var eight: UIImageView!
    @IBOutlet weak var nine: UIImageView!
    @IBOutlet weak var ten: UIImageView!
    @IBOutlet weak var jack: UIImageView!
    @IBOutlet weak var queen: UIImageView!
    @IBOutlet weak var king: UIImageView!
    @IBOutlet weak var endTurnButton: UIButton!
    
    
    var player = "Player One"
    var numberReceived = 1
    var opposingPlayer = "AI"
    var cardImageArray : [UIImageView] = []
    var selectedCard = ""
    var playerOneDeck : [Card] = []
    var aiDeck : [Card] = []
    var playerTwoDeck : [Card] = []
    var middleDeck : Deck = Deck()
    var cardTypes : [String] = []
    var cardAsking = 0
    var cardRemoval = 0
    var numberOfGottenCards = 0
    var canBeTapped : Bool = true
    var booksPlayerOne : [String] = []
    var booksPlayerTwo : [String] = []
    var booksAI : [String] = []
    
    /**
    Runs when the view is loaded. Initializes variables and creates card arrays
    **/
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImageArray = [ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king]
        cardTypes = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
        askingLabel.text = "Please choose a Card"
        answerLabel.text = ""
        endTurnButton.enabled = false
        canBeTapped = true
    }
    
    /**
    Action function that runs when a card is selected. Checks the image that has been selected. If the card is in the other player's deck, then the card is transferred to the player's deck. If not, the player is told to go fish
    **/
    @IBAction func cardTapRecognizer(sender: UITapGestureRecognizer) {
        cardAsking = 0
        cardRemoval = 0
        numberOfGottenCards = 0
        if canBeTapped == true {
            for image in cardImageArray {
                if (CGRectContainsPoint(image.frame, sender.locationInView(view))) {
                    selectedCard = "\(cardTypes[cardAsking])"
                    askingLabel.text = "You selected the \(cardTypes[cardAsking])"
                    canBeTapped = false
                    if numberReceived == 1 {
                        for card in aiDeck {
                            if card.name == selectedCard {
                                numberOfGottenCards++
                                playerOneDeck.append(card)
                                for aiCard in aiDeck {
                                    if aiCard.name == card.name {
                                        aiDeck.removeAtIndex(cardRemoval)
                                        cardRemoval--
                                    }
                                    cardRemoval++
                                }
                            }
                            answerLabel.text = "The AI has \(numberOfGottenCards) \(cardTypes[cardAsking])s"
                            endTurnButton.enabled = true
                        }
                        if numberOfGottenCards == 0 {
                            if middleDeck.deck.count != 0 {
                                let randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
                                let randomCard : Card = middleDeck.deck[randomNumber]
                                playerOneDeck.append(randomCard)
                                middleDeck.deck.removeAtIndex(randomNumber)
                                answerLabel.text = "The AI has no \(selectedCard)s, you Go Fish."
                            }
                            else {
                                answerLabel.text = "The AI has no \(selectedCard)s, and the middle deck is empty."
                            }
                        }
                    }
                    else if numberReceived == 2 {
                        cardRemoval = 0
                        if player == "Player One" {
                            for card in playerTwoDeck {
                                if card.name == selectedCard {
                                    numberOfGottenCards++
                                    playerOneDeck.append(card)
                                    for twoCard in playerTwoDeck {
                                        if twoCard.name == card.name {
                                            playerTwoDeck.removeAtIndex(cardRemoval)
                                            cardRemoval--
                                        }
                                        cardRemoval++
                                    }
                                }
                            }
                            answerLabel.text = "\(opposingPlayer) has \(numberOfGottenCards) \(cardTypes[cardAsking])s"
                            endTurnButton.enabled = true
                            if numberOfGottenCards == 0 {
                                if middleDeck.deck.count == 0 {
                                    answerLabel.text = "\(opposingPlayer) has no \(cardTypes[cardAsking])s, and the middle deck is empty."
                                }
                                else {
                                    let randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
                                    let randomCard : Card = middleDeck.deck[randomNumber]
                                    playerOneDeck.append(randomCard)
                                    middleDeck.deck.removeAtIndex(randomNumber)
                                    answerLabel.text = "\(opposingPlayer) has no \(cardTypes[cardAsking])s, you go fish."
                                }
                            }
                        }
                        else if player == "Player Two" {
                            cardRemoval = 0
                            for card in playerOneDeck {
                                if card.name == selectedCard {
                                    numberOfGottenCards++
                                    playerTwoDeck.append(card)
                                    for oneCard in playerOneDeck {
                                        if oneCard.name == card.name {
                                            playerOneDeck.removeAtIndex(cardRemoval)
                                            cardRemoval--
                                        }
                                        cardRemoval++
                                    }
                                }
                            }
                            answerLabel.text = "\(opposingPlayer) has \(numberOfGottenCards) \(cardTypes[cardAsking])s"
                            endTurnButton.enabled = true
                            if numberOfGottenCards == 0 {
                                if middleDeck.deck.count == 0 {
                                    answerLabel.text = "\(opposingPlayer) has no \(cardTypes[cardAsking])s, and the middle deck is empty."
                                }
                                else {
                                    let randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
                                    let randomCard : Card = middleDeck.deck[randomNumber]
                                    playerOneDeck.append(randomCard)
                                    middleDeck.deck.removeAtIndex(randomNumber)
                                    answerLabel.text = "\(opposingPlayer) has no \(cardTypes[cardAsking])s, you go fish."
                                }
                            }
                        }
                    }
                }
                cardAsking++
            }
        }
    }
    
    /**
    Action function that runs when the 'End Turn' button is pressed. Changes player states and segues back to the main view controller
    **/
    @IBAction func onEndTurnButtonPressed(sender: AnyObject) {
        if player == "Player One" && opposingPlayer == "Player Two" {
            let endTurnController = UIAlertController(title: "Turn Complete", message: "Please pass the phone to \(opposingPlayer)", preferredStyle: UIAlertControllerStyle.Alert)
            let passedAction = UIAlertAction(title: "Passed", style: UIAlertActionStyle.Default) { (action) -> Void in
                if self.player == "Player One" && self.opposingPlayer == "Player Two" {
                    self.player = "Player Two"
                    self.opposingPlayer = "Player One"
                }
                else if self.player == "Player Two" && self.opposingPlayer == "Player One" {
                    self.player = "Player One"
                    self.opposingPlayer = "Player Two"
                }
                self.performSegueWithIdentifier("return2GFSegue", sender: self)
            }
            endTurnController.addAction(passedAction)
            self.presentViewController(endTurnController, animated: true, completion: nil)
        }
        else if player == "Player Two" && opposingPlayer == "Player One" {
            let endTurnController = UIAlertController(title: "Turn Complete", message: "Please pass the phone to \(opposingPlayer)", preferredStyle: UIAlertControllerStyle.Alert)
            let passedAction = UIAlertAction(title: "Passed", style: UIAlertActionStyle.Default) { (action) -> Void in
                if self.player == "Player One" && self.opposingPlayer == "Player Two" {
                    self.player = "Player Two"
                    self.opposingPlayer = "Player One"
                }
                else if self.player == "Player Two" && self.opposingPlayer == "Player One" {
                    self.player = "Player One"
                    self.opposingPlayer = "Player Two"
                }
                self.performSegueWithIdentifier("return2GFSegue", sender: self)
            }
            endTurnController.addAction(passedAction)
            self.presentViewController(endTurnController, animated: true, completion: nil)
        }
        else {
            let endTurnController = UIAlertController(title: "Turn Complete", message: "Your turn is complete", preferredStyle: UIAlertControllerStyle.Alert)
            let passedAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
                if self.player == "Player One" && self.opposingPlayer == "AI" {
                    self.player = "AI"
                    self.opposingPlayer = "Player One"
                }
                else if self.player == "Player One" && self.opposingPlayer == "Player Two" {
                    self.player = "Player Two"
                    self.opposingPlayer = "Player One"
                }
                else if self.player == "Player Two" && self.opposingPlayer == "Player One" {
                    self.player = "Player One"
                    self.opposingPlayer = "Player Two"
                }
                self.performSegueWithIdentifier("return2GFSegue", sender: self)
            }
            endTurnController.addAction(passedAction)
            self.presentViewController(endTurnController, animated: true, completion: nil)
        }
    }
    /**
    Function that transfers the variables before the segue back to the main view controller occurs
    **/
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let next = segue.destinationViewController as! UINavigationController
        let top = next.topViewController as! GoFishViewController
        top.playersTurn = player
        top.aiDeck = aiDeck
        top.notPlayersTurn = opposingPlayer
        top.numberReceived = numberReceived
        top.middleDeck.deck = middleDeck.deck
        top.playerOneDeck = playerOneDeck
        top.playerTwoDeck = playerTwoDeck
        top.booksPlayerOne = booksPlayerOne
        top.booksPlayerTwo = booksPlayerTwo
        top.booksAI = booksAI
    }
}