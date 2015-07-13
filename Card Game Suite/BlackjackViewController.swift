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
    
    
    var numberRecieved:Int!
    var gameDeck:Deck!
    var playerSetup:Int = 1
    var playerArray:[User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameDeck = Deck()
        playerArray = []
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
                    /*self.introLabelObject.text = "Rohan, George, and Jason present..."
                    let doubleValue = NSNumber(double: 5.0)
                    UIView.animateWithDuration(NSTimeInterval(doubleValue.doubleValue), animations: { () -> Void in
                        self.introLabelObject.alpha = 1.0
                        return
                        }, completion: { ()  -> Void in
                            UIView.animateWithDuration(5.0, animations: { () -> Void in
                                self.introLabelObject.alpha = 0.0
                                return
                                }, completion: { () -> Void in
                                    self.introLabelObject.text = "Cardgames Suite BlackJack"
                                    UIView.animateWithDuration(5.0, animations: { () -> Void in
                                        self.introLabelObject.alpha = 1.0
                                        return
                                        }, completion: { () -> Void in
                                            UIView.animateWithDuration(5.0, animations: { () -> Void in
                                                self.introLabelObject.alpha = 0.0
                                                return
                                                }, completion: { () -> Void in
                                                    print("DONE AY")
                                            })
                                    })
                            })
                    })*/
                    
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
                                                    print("DONE AY")
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
    
    
    func setupGameView(){
    }
    
    
}