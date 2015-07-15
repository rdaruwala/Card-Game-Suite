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
    
    var player = "Player One"
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
        cardTypes = ["ace", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king"]
    }
    
    @IBAction func cardTapRecognizer(sender: UITapGestureRecognizer) {
        cardAsking = 0
        cardRemoval = 0
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
                                    }
                                    cardRemoval++
                                }
                            }
                        }
                    }
                    else if numberReceived == 2 {
                        for card in aiDeck {
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
                    }
                }
                cardAsking++
            }
        }
    }
}
