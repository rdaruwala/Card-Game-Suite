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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        blackJackButton.backgroundColor = UIColor.clearColor()
        blackJackButton.layer.cornerRadius = 10
        blackJackButton.layer.borderWidth = 3
        blackJackButton.layer.borderColor = UIColor.blueColor().CGColor
    }

    @IBAction func onBlackjackTapButton(sender: UIButton) {
        self.performSegueWithIdentifier("main2BJsegue", sender: self)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

