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
    var opposingPlayer = "AI"
    var cardImageArray : [UIImageView] = []
    var selectedCard = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        cardImageArray = [ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king]
    }

    @IBAction func cardTapRecognizer(sender: UITapGestureRecognizer) {
        for image in cardImageArray {
            if (CGRectContainsPoint(image.frame, sender.locationInView(view))) {
                selectedCard = "You selected the \(image)"
                askingLabel.text = selectedCard
            }
        }
    }
}
