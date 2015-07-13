//
//  user.swift
//  Card Game Suite
//
//  Created by George Gikas on 7/10/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import UIKit

class User {
    
    var name:String!
    var profilePic:UIImage?
    var password:String!
    var loggedIn:Bool!
    var isTurn:Bool
    var isOut:Bool
    
    init(name: String, password: String, profilePic: UIImage) {
        self.name = name
        self.profilePic = profilePic
        self.loggedIn = false
        self.isTurn = false
        self.isOut = false
    }
    
    init(name: String){
        self.name = name
        self.profilePic = nil
        self.loggedIn = false
        self.isTurn = false
        self.isOut = false
    }
    
    init(){
        self.name = "Guest"
        self.loggedIn = false
        self.isTurn = false
        self.isOut = false
    }
}