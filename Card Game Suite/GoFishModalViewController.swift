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
    var notPlayer = "Player Two"
    var numberReceived = 1
    var opposingPlayer = "AI"
    var cardImageArray : [UIImageView] = []
    var selectedCard = ""
    var playerOneDeck : [Card] = []
    var aiDeck : [Card] = []
    var playerTwoDeck : [Card] = []
    var middleDeck : Deck!
    var cardTypes : [String] = []
    var cardAsking = 0
    var cardRemoval = 0
    var numberOfGottenCards = 0
    var canBeTapped : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImageArray = [ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king]
        cardTypes = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
        askingLabel.text = "Please choose a Card"
        answerLabel.text = ""
        endTurnButton.enabled = false
        canBeTapped = true
        print("\(aiDeck.count)")
        for card in aiDeck {
            print(card.name)
        }
    }
    
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
                                    print(cardRemoval)
                                }
                            }
                            answerLabel.text = "The AI has \(numberOfGottenCards) \(cardTypes[cardAsking])s"
                            endTurnButton.enabled = true
                        }
                        if numberOfGottenCards == 0 {
                            let randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
                            let randomCard : Card = middleDeck.deck[randomNumber]
                            playerOneDeck.append(randomCard)
                            middleDeck.deck.removeAtIndex(randomNumber)
                            answerLabel.text = "The AI has no \(selectedCard)s, you Go Fish."
                        }
                    }
                    else if numberReceived == 2 {
                        if player == "Player One" {
                            for card in playerTwoDeck {
                                if card.name == selectedCard {
                                    numberOfGottenCards++
                                    playerOneDeck.append(card)
                                    for twoCard in playerTwoDeck {
                                        if twoCard.name == card.name {
                                            playerTwoDeck.removeAtIndex(cardRemoval)
                                        }
                                        cardRemoval++
                                    }
                                }
                            }
                            answerLabel.text = "\(notPlayer) has \(numberOfGottenCards) \(cardTypes[cardAsking])s"
                            endTurnButton.enabled = true
                            if numberOfGottenCards == 0 {
                                let randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
                                let randomCard : Card = middleDeck.deck[randomNumber]
                                playerOneDeck.append(randomCard)
                                middleDeck.deck.removeAtIndex(randomNumber)
                            }
                        }
                        else if player == "Player Two" {
                            for card in playerOneDeck {
                                if card.name == selectedCard {
                                    numberOfGottenCards++
                                    playerOneDeck.append(card)
                                    for oneCard in playerOneDeck {
                                        if oneCard.name == card.name {
                                            playerTwoDeck.removeAtIndex(cardRemoval)
                                        }
                                        cardRemoval++
                                    }
                                }
                            }
                            answerLabel.text = "\(notPlayer) has \(numberOfGottenCards) \(cardTypes[cardAsking])s"
                            endTurnButton.enabled = true
                            if numberOfGottenCards == 0 {
                                let randomNumber = Int(arc4random_uniform(UInt32(middleDeck.deck.count)))
                                let randomCard : Card = middleDeck.deck[randomNumber]
                                playerTwoDeck.append(randomCard)
                                middleDeck.deck.removeAtIndex(randomNumber)
                            }
                        }
                    }
                }
                cardAsking++
            }
        }
    }
    
    @IBAction func onEndTurnButtonPressed(sender: AnyObject) {
        if opposingPlayer == "Player One" || opposingPlayer == "Player Two" {
            let endTurnController = UIAlertController(title: "Turn Complete", message: "Please pass the phone to \(opposingPlayer)", preferredStyle: UIAlertControllerStyle.Alert)
            let passedAction = UIAlertAction(title: "Passed", style: UIAlertActionStyle.Default) { (action) -> Void in
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let next = segue.destinationViewController as! UINavigationController
        let top = next.topViewController as! GoFishViewController
        top.playersTurn = player
        top.notPlayersTurn = opposingPlayer
        top.numberReceived = numberReceived
        top.middleDeck.deck = middleDeck.deck
        top.playerOneDeck = playerOneDeck
        top.playerTwoDeck = playerTwoDeck
    }
}