//
//  BlackjackViewController.swift
//  Card Game Suite
//
//  Created by Rohan Daruwala on 7/10/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//


import UIKit

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
    
    
    
    var cardImageArray:[UIImageView]!
    
    
    var numberRecieved:Int!
    var gameDeck:Deck!
    var playerSetup:Int = 1
    var playerArray:[User]!
    var dealer:User!
    var playerTurn:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameDeck = Deck(type: "BlackJack")
        playerArray = []
        dealer = User(name: "The Dealer")
        introLabelObject.alpha = 0
        cardImageArray = [cardImage1, cardImage2, cardImage3, cardImage4, cardImage5, cardImage6, cardImage7, cardImage8, cardImage9, cardImage10, cardImage11]
        
        for image in cardImageArray{image.image = gameDeck.deck[42].image}
        
        /*for image in cardImageArray{
        image.image = nil
        }*/
        
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
        //setupGame()
        updateLabelScores()
        let timer = NSTimer(timeInterval: 1.5, target: self, selector: Selector("setupGame"), userInfo: nil, repeats: false)
        
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
                                                                self.beginGame()
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
        
        
    }
    
    
    func beginGame(){
        
        
        
        
    }
    
    func switchPlayer(){
        updateLabelScores()
        playerTurn++
        if(playerTurn > numberRecieved){
            playerTurn = 1
            dealerDraw()
        }
        
        if(playerArray.count > 1){
            passThePhone()
            introLabelObject.text = "It is now " + playerArray[playerTurn].name + "'s turn."
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
    
    func passThePhone(){
        let alert = UIAlertController(title: "Pass Phone", message: "Please pass the phone to: " + playerArray[playerTurn].name + ".", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: {void in
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func dealerDraw(){
        if(!dealer.isOut){
            introLabelObject.text = "It is now the dealer's turn"
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                self.introLabelObject.alpha = 1.0
                }) { finished in
                    UIView.animateWithDuration(1.5, animations: { () -> Void in
                        self.introLabelObject.alpha = 0.0
                        }, completion: { finished in
                            var toHit = false
                            for(var i = 0; i < self.playerArray.count; i++){
                                if(self.dealer.score < self.playerArray[i].score){
                                    toHit = true
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
                                                    UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                        self.introLabelObject.alpha = 1.5
                                                        }, completion: { finished in
                                                            UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                                self.introLabelObject.alpha = 0.0
                                                                }, completion: { finished in
                                                                    self.introLabelObject.textColor = UIColor.redColor()
                                                                    self.dealer.isOut = true
                                                                    self.switchPlayer()
                                                                    
                                                            })
                                                    })
                                                }
                                        })
                                })
                            }
                            
                    })
            }
        }
    }
    
    @IBAction func hitButtonAction(sender: AnyObject) {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.introLabelObject.alpha = 0.0
            }) { finished in
                let playersTurn:Int = self.findUserTurn()
                if(self.playerArray[playersTurn].isOut == false){
                    
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
                                        
                                        let actionSheet = UIAlertController(title: "Select Value", message: "Select the value of your Ace", preferredStyle: .ActionSheet)
                                        let oneOption = UIAlertAction(title: "One", style: .Default){ (action) -> Void in
                                            cardPicked.BJValue = 1
                                        }
                                        let elevenOption = UIAlertAction(title: "Eleven", style: .Default){ (action) -> Void in
                                            cardPicked.BJValue = 11
                                        }
                                        actionSheet.addAction(oneOption)
                                        actionSheet.addAction(elevenOption)
                                        self.presentViewController(actionSheet, animated: true, completion: nil)
                                        
                                    }
                                    self.gameDeck.deck.removeAtIndex(indexToPick)
                                    self.playerArray[playersTurn].score += cardPicked.BJValue
                                    if(self.playerArray[playersTurn].score > 21){
                                        self.introLabelObject.text = self.playerArray[playersTurn].name + " got a " + String(cardPicked.BJValue) + ", bringing the total score to" + String(self.playerArray[playersTurn].score) + "."
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
                                        self.introLabelObject.text = self.playerArray[playersTurn].name + " got a " + String(cardPicked.BJValue) + ", bringing the total score to" + String(self.playerArray[playersTurn].score) + "."
                                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                                            self.introLabelObject.alpha = 1.0
                                            }, completion: { finished in
                                                UIView.animateWithDuration(1.5, animations: { () -> Void in
                                                    self.introLabelObject.alpha = 0.0
                                                    }, completion: { finished in
                                                        self.switchPlayer()
                                                })
                                        })
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
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.introLabelObject.alpha = 0.0
            }) { finished in
                let playersTurn:Int = self.findUserTurn()
                
                UIView.animateWithDuration(5.0, animations: { () -> Void in
                    self.introLabelObject.text = self.playerArray[playersTurn].name + "has decided to stay"
                    self.introLabelObject.alpha = 1.0
                    }) { finished in
                        UIView.animateWithDuration(1.5, animations: { () -> Void in
                            self.introLabelObject.alpha = 0.0
                            }, completion: { finished in
                                self.playerArray[playersTurn].isTurn = false
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
            self.performSegueWithIdentifier("2homefromBJ", sender: self)
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
        for(var i = 0; i < player.cardsInHand.count; i++){
            if(player.cardsInHand[i].image == nil){return i}
        }
        return -1
    }
    
    func updateLabelScores(){
        
        dealerScoreLabel.text = "The Dealer's Score: " + String(dealer.score)
        
        for(var i = 0; i < numberRecieved; i++){
            if(i == 0){
                if let test:User = playerArray[i]{
                p1ScoreLabel.text = playerArray[i].name + "'s Score: " + String(playerArray[i].score)
                }
                else{
                    p1ScoreLabel.text = "Player " + String(i) + " is out."
                }
            }
            if(i == 1){
                if let test:User = playerArray[i]{
                p2ScoreLabel.text = playerArray[i].name + "'s Score: " + String(playerArray[i].score)
                }
                else{
                    p2ScoreLabel.text = "Player " + String(i) + " is out."
                }
            }
            if(i == 2){
                if let test:User = playerArray[i]{
                p3ScoreLabel.text = playerArray[i].name + "'s Score: " + String(playerArray[i].score)
                }
                else{
                    p3ScoreLabel.text = "Player " + String(i) + " is out."
                }
            }
            if(i == 3){
                if let test:User = playerArray[i]{
                p4ScoreLabel.text = playerArray[i].name + "'s Score: " + String(playerArray[i].score)
                }
                else{
                    p4ScoreLabel.text = "Player " + String(i) + " is out."
                }
            }
            
        }
    }
    
    
}