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
    
    init(name: String, profilePic: UIImage) {
        self.name = name
        self.profilePic = profilePic
    }
    
    init(name: String){
        self.name = name
        self.profilePic = nil
    }
    
    init(){
        self.name = "Guest"
    }
}