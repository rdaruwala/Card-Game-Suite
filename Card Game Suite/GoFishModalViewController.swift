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
    @IBOutlet weak var cardLabel1: UIImageView!
    @IBOutlet weak var cardLabel2: UIImageView!
    @IBOutlet weak var cardLabel3: UIImageView!
    @IBOutlet weak var cardLabel4: UIImageView!
    @IBOutlet weak var cardLabel5: UIImageView!
    @IBOutlet weak var cardLabel6: UIImageView!
    @IBOutlet weak var cardLabel7: UIImageView!
    @IBOutlet weak var cardLabel8: UIImageView!
    @IBOutlet weak var cardLabel9: UIImageView!
    @IBOutlet weak var cardLabel10: UIImageView!
    @IBOutlet weak var cardLabel11: UIImageView!
    @IBOutlet weak var cardLabel12: UIImageView!
    @IBOutlet weak var cardLabel13: UIImageView!
    
    var player = "Player One"
    var opposingPlayer = "AI"
    var cardImageArray : [UIImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        cardImageArray = [cardLabel1, cardLabel2, cardLabel3, cardLabel4, cardLabel5, cardLabel6, cardLabel7, cardLabel8, cardLabel9, cardLabel10, cardLabel11, cardLabel12, cardLabel13]
    }
    
    @IBAction func labelTapRecognizer(sender: UITapGestureRecognizer) {
        
    }
}
