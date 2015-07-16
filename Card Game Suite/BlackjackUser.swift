//
//  BlackjackUser.swift
//  Card Game Suite
//
//  Created by Rohan Daruwala on 7/15/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import UIKit

/**
User class that inherits from the User class. Uses a modified cardsInHand suited for Blackjack object cards
**/

class BlackjackUser: User {

    var BJcardsInHand:[BlackjackCard]
    
    override init(name: String, password: String, profilePic: UIImage) {
        self.BJcardsInHand = []
        super.init(name: name, password: password, profilePic: profilePic)
    }
    
    override init(name: String){
        self.BJcardsInHand = []
        super.init(name: name)
        
    }
    
    override init(){
        self.BJcardsInHand = []
        super.init()
    }
}