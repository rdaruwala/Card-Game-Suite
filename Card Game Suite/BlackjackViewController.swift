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
    
    
    var numberRecieved:Int!
    var gameDeck:Deck!
    var playerSetup:Int = 1
    var playerArray:[User]!
    var dealer:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameDeck = Deck(type: "BlackJack")
        playerArray = []
        dealer = User(name: "The Dealer")
        introLabelObject.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        setupGame()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGame(){
        let alertController = UIAlertController(
            title: "Add Player",
            message: "Enter name for player " + String(playerSetup),
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
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func beginGame(){
        
    }
    
    @IBAction func hitButtonAction(sender: AnyObject) {
        
        let playersTurn:Int = findUserTurn()
        if(playerArray[playersTurn].isOut == false){
            
            introLabelObject.text = playerArray[playersTurn].name + " has decided to hit."
            UIView.animateWithDuration(2, animations: { () -> Void in
                self.introLabelObject.alpha = 1.0
                }, completion: { finished in
                    UIView.animateWithDuration(2, animations: { () -> Void in
                        self.introLabelObject.alpha = 0.0
                        }, completion: { finished in
                            let indexToPick:Int = Int(arc4random_uniform(UInt32((self.gameDeck.deck.count))))
                            let cardPicked:BlackjackCard = BlackjackCard(type: self.gameDeck.deck[indexToPick])
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
                                                                playerArray.removeAtIndex(playersTurn)
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
                                                //TODO NEXT TURN FUNCTION
                                        })
                                })
                            }
                    })
                    
            })
            
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
        
        let playersTurn:Int = findUserTurn()
        
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
    
    
    
    
}