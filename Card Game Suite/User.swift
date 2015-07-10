//
//  user.swift
//  Card Game Suite
//
//  Created by George Gikas on 7/10/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import UIKit

class User {
    
    var name = ""
    var profilePic = UIImage(named: "default")
    
    convenience init(name: String, profilePic: UIImage) {
        self.init()
        self.name = name
        self.profilePic = profilePic
    }
}