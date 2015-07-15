//
//  BlackjackViewController.swift
//  Card Game Suite
//
//  Created by Rohan Daruwala on 7/10/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//


import UIKit
import Darwin

class BlackjackViewController: UIViewController {
    
    @IBOutlet weak var introLabelObject: UILabel!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var stayButton: UIButton!
    
    @IBOutlet weak var cardImage1: UIImageView!
    @IBOutlet weak var cardImage2: UIImageView!
    @IBOutlet weak var cardImage3: UIImageView!
    @IBOutlet weak var cardImage4: UIImageView!
    @IBOutlet weak var cardImage5: UIImageView!
    @IBOutlet weak var cardImage6: UIImageView!
    @IBOutlet weak var cardImage7: UIImageView!
    @IBOutlet weak var cardImage8: UIImageView!
    @IBOutlet weak var cardImage9: UIImageView!
    @IBOutlet weak var cardImage10: UIImageView!
    @IBOutlet weak var cardImage11: UIImageView!
    
    @IBOutlet weak var dealerScoreLabel: UILabel!
    @IBOutlet weak var p1ScoreLabel: UILabel!
    @IBOutlet weak var p2ScoreLabel: UILabel!
    @IBOutlet weak var p3ScoreLabel: UILabel!
    @IBOutlet weak var p4ScoreLabel: UILabel!
    
    var loopIteration = 0
    var waiting = true
    //var condition = NSCondition()
    var num:Int!
    
    
    var cardImageArray:[UIImageView]!
    
    
    var numberRecieved:Int!
    var gameDeck:Deck!
    var playerSetup:Int = 1
    var playerArray:[User]!
    var playerArray2:[User]!
    var dealer:User!
    var playerTurn:Int = 0
    var dealerIn = true
    var toNormalIterate = true
    var startSetup = true
    var pickNumber:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameDeck = Deck(type: "BlackJack")
        playerArray = []
        playerArray2 = []
        dealer = User(name: "The Dealer")
        introLabelObject.lineBreakMode = .ByWordWrapping
        introLabelObject.numberOfLines = 5
        introLabelObject.alpha = 0
        cardImageArray = [cardImage1, cardImage2, cardImage3, cardImage4, cardImage5, cardImage6, cardImage7, cardImage8, cardImage9, cardImage10, cardImage11]
        
        //for image in cardImageArray{image.image = gameDeck.deck[42].image}
        
        for image in cardImageArray{
            image.image = nil
        }
        
        hitButton.backgroundColor = UIColor.clearColor()
        hitButton.layer.cornerRadius = 10
        hitButton.layer.borderWidth = 3
        hitButton.layer.borderColor = UIColor.blueColor().CGColor
        hitButton.hidden = true
        
        stayButton.backgroundColor = UIColor.clearColor()
        stayButton.layer.cornerRadius = 10
        stayButton.layer.borderWidth = 3
        stayButton.layer.borderColor = UIColor.blueColor().CGColor
        stayButton.hidden = true
        
        dealerScoreLabel.hidden = true
        p1ScoreLabel.hidden = true
        p2ScoreLabel.hidden = true
        p3ScoreLabel.hidden = true
        p4ScoreLabel.hidden = true
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        setupGame()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGame(){
        if(playerSetup == 1){
            let beginningController = UIAlertController(
                title: "Welcome!",
                message: "You will now create the players for this game",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            
            let continueAction = UIAlertAction(
                title: "Okay", style: UIAlertActionStyle.Default) {
                    (action) -> Void in
                    
                    
                    let alertController = UIAlertController(
                        title: "Add Player",
                        message: "Enter name for player " + String(self.playerSetup),
                        preferredStyle: UIAlertControllerStyle.Alert)
                    
                    let okAction = UIAlertAction(
                        title: "Continue", style: UIAlertActionStyle.Default) {
                            (action) -> Void in
                            let player = User(name: (alertController.textFields?.first!.text)!)
                            self.playerArray.append(player)
                            self.playerArray2.append(player)
                            if(self.playerSetup != self.numberRecieved){
                                self.playerSetup++
                                self.setupGame()
                            }
                            else{
                                self.introLabelObject.text = "Rohan, George, and Jason present..."
                                let doubleValue = NSNumber(double: 2.5)
                                UIView.animateWithDuration(NSTimeInterval(doubleValue.doubleValue), animations: { () -> Void in
                                    self.introLabelObject.alpha = 1.0
                                    return
                                    }, completion: { finished in
                                        UIView.animateWithDuration(2.5, animations: { () -> Void in
                                            self.introLabelObject.alpha = 0.0
                                            return
                                            }, completion: { finished in
                                                self.introLabelObject.text = "Cardgames Suite BlackJack"
                                                UIView.animateWithDuration(2.5, animations: { () -> Void in
                                                    self.introLabelObject.alpha = 1.0
                                                    return
                                                    }, completion: { finished in
                                                        UIView.animateWithDuration(2.5, animations: { () -> Void in
                                                            self.introLabelObject.alpha = 0.0
                                                            return
                                                            }, completion: { finished in
                                                                self.aBeginNewGame()
                                                        })
                                                })
                                        })
                                })
                                
                            }
                    }
                    
                    alertController.addTextFieldWithConfigurationHandler {
                        (playerName) -> Void in
                    }
                    
                    alertController.addAction(okAction)
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
            }
            
            beginningController.addAction(continueAction)
            self.presentViewController(beginningController, animated: true, completion: nil)
            
        }
        else{
            let alertController = UIAlertController(
                title: "Add Player",
                message: "Enter name for player " + String(self.playerSetup),
                preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(
                title: "Continue", style: UIAlertActionStyle.Default) {
                    (action) -> Void in
                    let player = User(name: (alertController.textFields?.first!.text)!)
                    self.playerArray.append(player)
                    self.playerArray2.append(player)
                    if(self.playerSetup != self.numberRecieved){
                        self.playerSetup++
                        self.setupGame()
                    }
                    else{
                        self.introLabelObject.text = "Rohan, George, and Jason present..."
                        let doubleValue = NSNumber(double: 2.5)
                        UIView.animateWithDuration(NSTimeInterval(doubleValue.doubleValue), animations: { () -> Void in
                            self.introLabelObject.alpha = 1.0
                            return
                            }, completion: { finished in
                                UIView.animateWithDuration(2.5, animations: { () -> Void in
                                    self.introLabelObject.alpha = 0.0
                                    return
                                    }, completion: { finished in
                                        self.introLabelObject.text = "Cardgames Suite BlackJack"
                                        UIView.animateWithDuration(2.5, animations: { () -> Void in
                                            self.introLabelObject.alpha = 1.0
                                            return
                                            }, completion: { finished in
                                                UIView.animateWithDuration(2.5, animations: { () -> Void in
                                                    self.introLabelObject.alpha = 0.0
                                                    return
                                                    }, completion: { finished in
                                                        self.aBeginNewGame()
                                                })
                                        })
                                })
                        })
                        
                    }
            }
            
            alertController.addTextFieldWithConfigurationHandler {
                (playerName) -> Void in
            }
            
            alertController.addAction(okAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        
    }
    
    func aBeginNewGame(){
        if(waiting){
            print(loopIteration)
            toNormalIterate = true
            if (loopIteration >= numberRecieved){
                loopIteration = 9001
                
                let indexToPick3:Int = Int(arc4random_uniform(UInt32((self.gameDeck.deck.count))))
                let cardPicked3:BlackjackCard = BlackjackCard(type: self.gameDeck.deck[indexToPick3])
                gameDeck.deck.removeAtIndex(indexToPick3)
                dealer.score += cardPicked3.BJValue
                
                let indexToPick4:Int = Int(arc4random_uniform(UInt32((self.gameDeck.deck.count))))
                let cardPicked4:BlackjackCard = BlackjackCard(type: self.gameDeck.deck[indexToPick4])
                gameDeck.deck.removeAtIndex(indexToPick4)
                dealer.score += cardPicked4.BJValue
                
                NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("switchPlayer"), userInfo: nil, repeats: false)
                
            }
            if(loopIteration < numberRecieved){
                if(loopIteration < 3){
                    unloadPlayerSetup()
                    pickFirstCard()
                }
                /* else{
                NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("switchPlayer"), userInfo: nil, repeats: false)
                }*/
            }
            if(loopIteration >= numberRecieved){
                
            }
            else{
                //  if(waiting){
                
                //    if(startSetup){
                loopIteration++
                NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("aBeginNewGame"), userInfo: nil, repeats: false)
                //    }
            }
            // }
        }
        //  NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("aBeginNewGame"), userInfo: nil, repeats: true)
    }
    
    func pickFirstCard(){
        if(waiting && cardImage1.image != nil && cardImage2.image != nil){
            return
        }
        
        if(waiting && startSetup){
            unloadPlayerSetup()
            startSetup = false
            pickNumber = loopIteration
            introLabelObject.text = "Now giving two cards to: " + playerArray[self.pickNumber].name
            introLabelObject.alpha = 1.0
            
            let indexToPick:Int = Int(arc4random_uniform(UInt32((self.gameDeck.deck.count))))
            //let indexToPick:Int = 0
            let cardPicked:BlackjackCard = BlackjackCard(type: self.gameDeck.deck[indexToPick])
            gameDeck.deck.removeAtIndex(indexToPick)
            cardImage1.image = cardPicked.image
            print("1 " + cardPicked.name)
            waiting = true
            
            if(cardPicked.name == "Ace" && waiting){
                waiting = false
                let actionSheet = UIAlertController(title: playerArray[self.pickNumber].name + "'s Card", message: playerArray[self.pickNumber].name + ", please select the value of your Ace", preferredStyle: .ActionSheet)
                let oneOption = UIAlertAction(title: "One", style: .Default){ (action) -> Void in
                    cardPicked.BJValue = 1
                    self.playerArray[self.pickNumber].cardsInHand.append(cardPicked)
                    self.waiting = true
                    self.pickSecondCard()
                    return
                }
                let elevenOption = UIAlertAction(title: "Eleven", style: .Default){ (action) -> Void in
                    cardPicked.BJValue = 11
                    self.playerArray[self.pickNumber].cardsInHand.append(cardPicked)
                    self.waiting = true
                    self.pickSecondCard()
                    return
                }
                actionSheet.addAction(oneOption)
                actionSheet.addAction(elevenOption)
                self.presentViewController(actionSheet, animated: true, completion: nil)
                
            }
            else{
                if let temp:User? = playerArray[self.pickNumber]{
                    
                    playerArray[self.pickNumber].cardsInHand.append(cardPicked)
                    self.pickSecondCard()
                    return
                }
            }
        }
        
        if(waiting){
            if(cardImage1.image != nil && cardImage2 == nil){
                
            }
        }
        else{
            NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("pickFirstCard"), userInfo: nil, repeats: false) //CHECK
        }
        
        
    }
    
    func pickSecondCard(){
        if(waiting && cardImage1.image != nil && cardImage2.image != nil){
            return
        }
        if(waiting){
            let indexToPick2:Int = Int(arc4random_uniform(UInt32((self.gameDeck.deck.count))))
            let cardPicked2:BlackjackCard = BlackjackCard(type: self.gameDeck.deck[indexToPick2])
            gameDeck.deck.removeAtIndex(indexToPick2)
            cardImage2.image = cardPicked2.image
            print("2 " + cardPicked2.name)
            waiting = true
            if(cardPicked2.name == "Ace"){
                print("14")
                waiting = false
                let actionSheet2 = UIAlertController(title: playerArray[self.pickNumber].name + "'s Card", message: playerArray[self.pickNumber].name + ", please select the value of your Ace", preferredStyle: .ActionSheet)
                let oneOption2 = UIAlertAction(title: "One", style: .Default){ (action) -> Void in
                    cardPicked2.BJValue = 1
                    self.playerArray[self.pickNumber].cardsInHand.append(cardPicked2)
                    self.waiting = true
                    self.startSetup = true
                    return
                }
                let elevenOption2 = UIAlertAction(title: "Eleven", style: .Default){ (action) -> Void in
                    cardPicked2.BJValue = 11
                    self.playerArray[self.pickNumber].cardsInHand.append(cardPicked2)
                    self.waiting = true
                    self.startSetup = true
                    return
                    
                }
                actionSheet2.addAction(oneOption2)
                actionSheet2.addAction(elevenOption2)
                self.presentViewController(actionSheet2, animated: true, completion: nil)
                
            }
            else{
                if let temp:User? = playerArray[self.pickNumber]{
                    playerArray[self.pickNumber].cardsInHand.append(cardPicked2)
                    startSetup = true
                }
            }
        }
        
        if(!waiting){
            NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("pickSecondCard"), userInfo: nil, repeats: true)
        }
    }
    
    func switchPlayer(){
        if(waiting){
            
            for(var i = 0; i < playerArray2.count; i++){
                playerArray2[i].score = 0
                for(var j = 0; j < playerArray2[i].cardsInHand.count; j++){
                    playerArray2[i].score += BlackjackCard(type: playerArray2[i].cardsInHand[j]).BJValue
                }
            }
            
            print("TOP")
            unloadPlayerSetup()
            if(playerTurn == 0){playerTurn++}
            if(playerTurn > playerArray.count){
                playerTurn = 1
            }
            if(playerArray.count == 0){
                dealerDraw()
            }
            
            print(playerArray.count)
            print(playerArray2.count)
            if(playerArray.count >= 1){
                if(playerArray.count != 1){
                    passThePhone()
                }
                introLabelObject.text = "It is now " + playerArray[playerTurn-1].name + "'s turn."
                playerArray[playerTurn-1].isTurn = true
                print(playerArray[playerTurn-1].name)
                loadPlayerSetup(playerArray[playerTurn-1])
                UIView.animateWithDuration(1.5, animations: { () -> Void in
                    self.introLabelObject.alpha = 1.0
                    }, completion: { finished in
                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                            self.introLabelObject.alpha = 0.0
                            }, completion: { finished in
                                self.introLabelObject.text = "Hit or Stay?"
                                self.hitButton.hidden = false
                                self.stayButton.hidden = false
                                UIView.animateWithDuration(1.5, animations: { () -> Void in
                                    self.introLabelObject.alpha = 1.0
                                    }, completion: nil)
                        })
                })
            }
        }
        /*else{
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("switchPlayer()"), userInfo: nil, repeats: true)
        }*/
    }
    
    func passThePhone(){
        let alert = UIAlertController(title: "Pass Phone", message: "Please pass the phone to: " + playerArray[playerTurn-1].name + ".", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: {void in
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func dealerDraw(){
        if(dealer.isOut == false){
            updateLabelScores()
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                self.introLabelObject.alpha = 0.0
                }, completion: { finished in
                    self.introLabelObject.text = "It is now the dealer's turn"
                    UIView.animateWithDuration(1.5, animations: { () -> Void in
                        self.introLabelObject.alpha = 1.0
                        }) { finished in
                            UIView.animateWithDuration(1.5, animations: { () -> Void in
                                self.introLabelObject.alpha = 0.0
                                }, completion: { finished in
                                    var toHit = false
                                    for(var i = 0; i < self.playerArray2.count; i++){
                                        if(self.playerArray2[i].score <= 21){
                                            if(self.dealer.score < self.playerArray2[i].score){
                                                toHit = true
                                            }
                                        }
                                    }
                                    if(toHit){
                                        let indexToPick:Int = Int(arc4random_uniform(UInt32((self.gameDeck.deck.count))))
                                        let cardPicked:BlackjackCard = BlackjackCard(type: self.gameDeck.deck[indexToPick])
                                        self.dealer.score += cardPicked.BJValue
                                        self.introLabelObject.text = "The Dealer drew a " + cardPicked.name + " giving a total score of: " + String(self.dealer.score) + "."
                                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                                            self.introLabelObject.alpha = 1.0
                                            }, completion: { finished in
                                                UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                    self.introLabelObject.alpha = 0.0
                                                    }, completion: { finished in
                                                        if(self.dealer.score > 21){
                                                            self.introLabelObject.text = "The dealer is out!"
                                                            self.introLabelObject.textColor = UIColor.greenColor()
                                                            self.dealer.isOut = true
                                                            self.dealerIn = false
                                                            self.checkForWinner()
                                                            UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                                self.introLabelObject.alpha = 1.5
                                                                }, completion: { finished in
                                                                    UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                                        self.introLabelObject.alpha = 0.0
                                                                        }, completion: { finished in
                                                                            self.introLabelObject.textColor = UIColor.redColor()
                                                                            self.dealer.isOut = true
                                                                            self.dealerIn = false
                                                                            self.switchPlayer()
                                                                            
                                                                    })
                                                            })
                                                        }
                                                        else if(self.dealer.score == 21){
                                                            self.winner(self.dealer)
                                                        }
                                                        toHit = false
                                                        for(var i = 0; i < self.playerArray2.count; i++){
                                                            if(self.dealer.score < self.playerArray2[i].score){
                                                                toHit = true
                                                            }
                                                        }
                                                        if(toHit){self.dealerDraw()}
                                                        else{self.checkForWinner()}
                                                })
                                        })
                                    }
                                    else{
                                        self.introLabelObject.text = "The dealer is staying with a score of: " + String(self.dealer.score)
                                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                                            self.introLabelObject.alpha = 1.0
                                            }, completion: { finished in
                                                UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                    self.introLabelObject.alpha = 0.0
                                                    }, completion: { finished in
                                                        self.dealerIn = false
                                                        self.checkForWinner()
                                                        
                                                })
                                        })
                                    }
                                    
                            })
                    }
                    
            })
            
        }
        
    }
    
    @IBAction func hitButtonAction(sender: AnyObject) {
        
        hitButton.hidden = true
        stayButton.hidden = true
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.introLabelObject.alpha = 0.0
            }) { finished in
                let playersTurn:Int = self.findUserTurn()
                if(self.playerArray[playersTurn].isOut == false){
                    self.playerArray[self.playerTurn-1].isTurn = false
                    self.introLabelObject.text = self.playerArray[playersTurn].name + " has decided to hit."
                    UIView.animateWithDuration(2, animations: { () -> Void in
                        self.introLabelObject.alpha = 1.0
                        }, completion: { finished in
                            UIView.animateWithDuration(2, animations: { () -> Void in
                                self.introLabelObject.alpha = 0.0
                                }, completion: { finished in
                                    let indexToPick:Int = Int(arc4random_uniform(UInt32((self.gameDeck.deck.count))))
                                    let cardPicked:BlackjackCard = BlackjackCard(type: self.gameDeck.deck[indexToPick])
                                    
                                    let imageIndex = self.findEmptyImageSlot(self.playerArray[playersTurn])
                                    self.cardImageArray[imageIndex].image = cardPicked.image
                                    
                                    if(cardPicked.name == "Ace"){
                                        self.waiting = false
                                        let actionSheet = UIAlertController(title: "Select Value", message: "Select the value of your Ace", preferredStyle: .ActionSheet)
                                        let oneOption = UIAlertAction(title: "One", style: .Default){ (action) -> Void in
                                            cardPicked.BJValue = 1
                                            self.waiting = true
                                            self.playerArray[playersTurn].cardsInHand.append(cardPicked)
                                            self.gameDeck.deck.removeAtIndex(indexToPick)
                                            self.playerArray[playersTurn].score += cardPicked.BJValue
                                            if(self.playerArray[playersTurn].score > 21){
                                                self.introLabelObject.text = self.playerArray[playersTurn].name + " got a " + String(cardPicked.BJValue) + ", bringing the total score to " + String(self.playerArray[playersTurn].score) + "."
                                                UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                    self.introLabelObject.alpha = 1.0
                                                    }, completion: { finished in
                                                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                            self.introLabelObject.alpha = 0.0
                                                            }, completion: { finished in
                                                                self.introLabelObject.text = self.playerArray[playersTurn].name + " is out!"
                                                                UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                                    self.introLabelObject.alpha = 1.0
                                                                    }, completion: { finished in
                                                                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                                            self.introLabelObject.alpha = 0.0
                                                                            }, completion: { finished in
                                                                                self.playerArray.removeAtIndex(playersTurn)
                                                                                //self.playerTurn++
                                                                                self.switchPlayer()
                                                                        })
                                                                })
                                                        })
                                                })
                                            }
                                                
                                            else if(self.playerArray[playersTurn].score == 21){
                                                self.winner(self.playerArray[playersTurn])
                                            }
                                            else{
                                                self.introLabelObject.text = self.playerArray[playersTurn].name + " got a " + String(cardPicked.BJValue) + ", bringing the total score to " + String(self.playerArray[playersTurn].score) + "."
                                                UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                    self.introLabelObject.alpha = 1.0
                                                    }, completion: { finished in
                                                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                            self.introLabelObject.alpha = 0.0
                                                            }, completion: { finished in
                                                                self.playerTurn++
                                                                self.switchPlayer()
                                                        })
                                                })
                                            }
                                        }
                                        let elevenOption = UIAlertAction(title: "Eleven", style: .Default){ (action) -> Void in
                                            cardPicked.BJValue = 11
                                            self.waiting = true
                                            self.playerArray[playersTurn].cardsInHand.append(cardPicked)
                                            self.gameDeck.deck.removeAtIndex(indexToPick)
                                            self.playerArray[playersTurn].score += cardPicked.BJValue
                                            if(self.playerArray[playersTurn].score > 21){
                                                self.introLabelObject.text = self.playerArray[playersTurn].name + " got a " + String(cardPicked.BJValue) + ", bringing the total score to " + String(self.playerArray[playersTurn].score) + "."
                                                UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                    self.introLabelObject.alpha = 1.0
                                                    }, completion: { finished in
                                                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                            self.introLabelObject.alpha = 0.0
                                                            }, completion: { finished in
                                                                self.introLabelObject.text = self.playerArray[playersTurn].name + " is out!"
                                                                UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                                    self.introLabelObject.alpha = 1.0
                                                                    }, completion: { finished in
                                                                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                                            self.introLabelObject.alpha = 0.0
                                                                            }, completion: { finished in
                                                                                self.playerArray.removeAtIndex(playersTurn)
                                                                                //self.playerTurn++
                                                                                self.switchPlayer()
                                                                        })
                                                                })
                                                        })
                                                })
                                            }
                                                
                                            else if(self.playerArray[playersTurn].score == 21){
                                                self.winner(self.playerArray[playersTurn])
                                            }
                                            else{
                                                self.introLabelObject.text = self.playerArray[playersTurn].name + " got a " + String(cardPicked.BJValue) + ", bringing the total score to " + String(self.playerArray[playersTurn].score) + "."
                                                UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                    self.introLabelObject.alpha = 1.0
                                                    }, completion: { finished in
                                                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                            self.introLabelObject.alpha = 0.0
                                                            }, completion: { finished in
                                                                self.playerTurn++
                                                                self.switchPlayer()
                                                        })
                                                })
                                            }
                                            
                                        }
                                        actionSheet.addAction(oneOption)
                                        actionSheet.addAction(elevenOption)
                                        self.presentViewController(actionSheet, animated: true, completion: nil)
                                        
                                    }
                                    else{
                                        self.playerArray[playersTurn].cardsInHand.append(cardPicked)
                                        self.gameDeck.deck.removeAtIndex(indexToPick)
                                        self.playerArray[playersTurn].score += cardPicked.BJValue
                                        if(self.playerArray[playersTurn].score > 21){
                                            self.introLabelObject.text = self.playerArray[playersTurn].name + " got a " + String(cardPicked.BJValue) + ", bringing the total score to " + String(self.playerArray[playersTurn].score) + "."
                                            UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                self.introLabelObject.alpha = 1.0
                                                }, completion: { finished in
                                                    UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                        self.introLabelObject.alpha = 0.0
                                                        }, completion: { finished in
                                                            self.introLabelObject.text = self.playerArray[playersTurn].name + " is out!"
                                                            UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                                self.introLabelObject.alpha = 1.0
                                                                }, completion: { finished in
                                                                    UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                                        self.introLabelObject.alpha = 0.0
                                                                        }, completion: { finished in
                                                                            self.playerArray.removeAtIndex(playersTurn)
                                                                            //self.playerTurn++
                                                                            self.switchPlayer()
                                                                    })
                                                            })
                                                    })
                                            })
                                        }
                                            
                                        else if(self.playerArray[playersTurn].score == 21){
                                            self.winner(self.playerArray[playersTurn])
                                        }
                                        else{
                                            self.introLabelObject.text = self.playerArray[playersTurn].name + " got a " + String(cardPicked.BJValue) + ", bringing the total score to " + String(self.playerArray[playersTurn].score) + "."
                                            UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                self.introLabelObject.alpha = 1.0
                                                }, completion: { finished in
                                                    UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                        self.introLabelObject.alpha = 0.0
                                                        }, completion: { finished in
                                                            self.playerTurn++
                                                            self.switchPlayer()
                                                    })
                                            })
                                        }
                                    }
                            })
                            
                    })
                    
                }
                
        }
    }
    
    
    func findUserTurn()->Int{
        for(var i = 0; i < playerArray.count; i++){
            if(playerArray[i].isTurn){
                return i
            }
        }
        return -1
    }
    
    
    
    @IBAction func stayButtonAction(sender: AnyObject) {
        
        hitButton.hidden = true
        stayButton.hidden = true
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.introLabelObject.alpha = 0.0
            }) { finished in
                let playersTurn:Int = self.findUserTurn()
                self.playerArray[playersTurn].isTurn = false
                UIView.animateWithDuration(5.0, animations: { () -> Void in
                    self.introLabelObject.text = self.playerArray[playersTurn].name + " has decided to stay"
                    self.introLabelObject.alpha = 1.0
                    }) { finished in
                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                            self.introLabelObject.alpha = 0.0
                            }, completion: { finished in
                                self.playerArray[playersTurn].isTurn = false
                                self.playerArray.removeAtIndex(playersTurn)
                                //self.playerTurn++
                                self.switchPlayer()
                        })
                }
        }
        
    }
    
    func winner(winner: User){
        introLabelObject.text = winner.name + " is the winner!"
        introLabelObject.textColor = UIColor.orangeColor()
        introLabelObject.alpha = 1.0
        
        let alert = UIAlertController(title: "Winner!", message: winner.name + " has won the game!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Return to home screen", style: UIAlertActionStyle.Default, handler: {void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func loadPlayerSetup(player: User){
        for(var i = 0; i < player.cardsInHand.count; i++){
            cardImageArray[i].image = player.cardsInHand[i].image
        }
    }
    
    func unloadPlayerSetup(){
        for image in cardImageArray{
            image.image = nil
        }
    }
    
    func findEmptyImageSlot(player: User)-> Int{
        for(var i = 0; i < cardImageArray.count; i++){
            if(cardImageArray[i].image == nil){return i}
        }
        return -1
    }
    
    func checkForWinner(){
        
        for(var i = 0; i < playerArray2.count; i++){
            if(playerArray2[i].score == 21){
                winner(playerArray2[0])
            }
        }
        
        if(numberRecieved > 1){
            if(playerArray.count == 0){
                var winnerPlayer:User = User()
                for(var i = 0; i < playerArray2.count; i++){
                    if(playerArray2[i].score > 21){playerArray2.removeAtIndex(i)}
                }
                if(playerArray2.count == 0){
                    if(dealer.isOut == false){
                        winner(dealer)
                    }
                }
                for(var i = 0; i < playerArray2.count; i++){
                    if(playerArray2[i].score > winnerPlayer.score && playerArray2[i].score <= 21){
                        winnerPlayer = playerArray2[i]
                    }
                }
                if(dealer.isOut && winnerPlayer.score <= 21){
                    self.winner(winnerPlayer)
                }
                else if(dealer.score <= 21){
                    winner(dealer)
                }
                else{
                    introLabelObject.text = "Draw"
                    introLabelObject.textColor = UIColor.orangeColor()
                    introLabelObject.alpha = 1.0
                    
                    let alert = UIAlertController(title: "Draw",message: "Nobody won the game", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Return to home screen", style: UIAlertActionStyle.Default, handler: {void in
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
        }
        else{
            if(playerArray.count == 0){
                if(playerArray2[0].score > dealer.score && playerArray2[0].score <= 21){
                    winner(playerArray2[0])
                }
                else if(dealer.score <= 21){
                    winner(dealer)
                }
                else{
                    introLabelObject.text = "Draw"
                    introLabelObject.textColor = UIColor.orangeColor()
                    introLabelObject.alpha = 1.0
                    
                    let alert = UIAlertController(title: "Draw",message: "Nobody won the game", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Return to home screen", style: UIAlertActionStyle.Default, handler: {void in
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func updateLabelScores(){
        
        for(var i = 0; i < playerArray2.count; i++){
            if(i == 0){
                if let test:User = playerArray2[i]{
                    p1ScoreLabel.hidden = false
                    p1ScoreLabel.text = playerArray2[i].name + "'s Score: " + String(playerArray2[i].score)
                }
                else{
                    p1ScoreLabel.text = playerArray[i].name + " is out."
                }
            }
            if(i == 1){
                if let test:User = playerArray2[i]{
                    p2ScoreLabel.hidden = false
                    p2ScoreLabel.text = playerArray2[i].name + "'s Score: " + String(playerArray2[i].score)
                }
                else{
                    p2ScoreLabel.text = playerArray[i].name + " is out."
                }
            }
            if(i == 2){
                if let test:User = playerArray2[i]{
                    p3ScoreLabel.hidden = false
                    p3ScoreLabel.text = playerArray2[i].name + "'s Score: " + String(playerArray2[i].score)
                }
                else{
                    p3ScoreLabel.text = playerArray[i].name + " is out."
                }
            }
            
        }
    }
}