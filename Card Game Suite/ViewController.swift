//
//  ViewController.swift
//  Card Game Suite
//
//  Created by Rohan Daruwala on 7/10/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blackJackButton: UIButton!
    @IBOutlet weak var goFishButton: UIButton!
    
    
    var numPlayers:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        
        blackJackButton.backgroundColor = UIColor.clearColor()
        blackJackButton.layer.cornerRadius = 10
        blackJackButton.layer.borderWidth = 3
        blackJackButton.layer.borderColor = UIColor.blueColor().CGColor
        
        goFishButton.backgroundColor = UIColor.clearColor()
        goFishButton.layer.cornerRadius = 10
        goFishButton.layer.borderWidth = 3
        goFishButton.layer.borderColor = UIColor.blueColor().CGColor
    }
    
    @IBAction func onBlackjackTapButton(sender: UIButton) {
        let actionSheet = UIAlertController(title: "Select Players", message: "Select the number of players", preferredStyle: .ActionSheet)
        let singleplayer = UIAlertAction(title: "One player", style: .Default){ (action) -> Void in
            self.numPlayers = 1
            self.performSegueWithIdentifier("main2BJsegue", sender: self)
        }
        let twoPlayers = UIAlertAction(title: "Two players", style: .Default){ (action) -> Void in
            self.numPlayers = 2
            self.performSegueWithIdentifier("main2BJsegue", sender: self)
        }
        let threePlayers = UIAlertAction(title: "Three players", style: .Default){ (action) -> Void in
            self.numPlayers = 3
            self.performSegueWithIdentifier("main2BJsegue", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        actionSheet.addAction(singleplayer)
        actionSheet.addAction(twoPlayers)
        actionSheet.addAction(threePlayers)
        actionSheet.addAction(cancelAction)
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    
    
    @IBAction func onGoFishButtonTap(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Select Players", message: "Select the number of players", preferredStyle: .ActionSheet)
        let singleplayer = UIAlertAction(title: "One player", style: .Default){ (action) -> Void in
            self.numPlayers = 1
            self.performSegueWithIdentifier("home2GFSegue", sender: self)
        }
        let twoPlayers = UIAlertAction(title: "Two players", style: .Default){ (action) -> Void in
            self.numPlayers = 2
            self.performSegueWithIdentifier("home2GFSegue", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
        
        actionSheet.addAction(singleplayer)
        actionSheet.addAction(twoPlayers)
        actionSheet.addAction(cancelAction)
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "main2BJsegue"){
            let next =  segue.destinationViewController as! BlackjackViewController
            next.numberRecieved = numPlayers
        }
        else {
            print("num \(self.numPlayers!)")
            let next = segue.destinationViewController as! UINavigationController
            let top = next.topViewController as! GoFishViewController
            top.numberReceived = numPlayers!
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

