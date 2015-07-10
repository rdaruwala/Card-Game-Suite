//
//  Card.swift
//  Card Game Suite
//
//  Created by Rohan Daruwala on 7/10/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import Foundation
import UIKit


class Card{
    
    var suite:String
    var name:String
    var image:UIImage?
    
    init(name: String, suite: String, image: UIImage){
        self.name = name
        self.suite = suite
        self.image = image
    }
    
    init(name: String, suite:String){
        self.name = name
        self.suite = suite
        self.image = nil
    }
    
    
}