//
//  BlackjackViewController.swift
//  Card Game Suite
//
//  Created by Rohan Daruwala on 7/10/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import UIKit

class BlackjackViewController: UIViewController {
    
    var numberRecieved:Int!
    var gameDeck:Deck!
    
    var playerArray:[User]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameDeck = Deck()
        playerArray = []
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("setupPlayers"), userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupPlayers(){
        
        for(var i = 0; i < numberRecieved; i++){

        
            /*let alert = UIAlertView()
            alert.title = "Player " + String(i+1) + " name:"
            alert.addButtonWithTitle("Done")
            alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
            alert.addButtonWithTitle("Cancel")
            alert.show()
            
            let textField = alert.textFieldAtIndex(0)
            var player = User(name: textField!.text!)
            playerArray.append(player)*/
            
            var alertController = UIAlertController(
                title: "Add Player",
                message: "Enter name for player " + String(i+1),
                preferredStyle: UIAlertControllerStyle.Alert)
            
            var okAction = UIAlertAction(
                title: "Continue", style: UIAlertActionStyle.Default) {
                    (action) -> Void in
                    let player = User(name: (alertController.textFields?.first!.text)!)
                    self.playerArray.append(player)
            }
            
            alertController.addTextFieldWithConfigurationHandler {
                (playerName) -> Void in
            }
            
            alertController.addAction(okAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        
        }
    }
    

}
