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
        print(gameDeck.deck.count)
        print(gameDeck.deck[15].name)
        let t:BlackjackCard = BlackjackCard(type: gameDeck.deck[15])
        print(String(t.BJValue))
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
    
    
}