//
//  BlackjackCard.swift
//  Card Game Suite
//
//  Created by Rohan Daruwala on 7/10/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import Foundation
import UIKit

class BlackjackCard : Card{
    
    var BJValue:Int
    
    init(name: String, suite: String, image: UIImage, value: Int){
        self.BJValue = value
        super.init(name: name, suite: suite, image: image)
    }
    
    override init(type: Card){
        if(type.name == "Ace"){self.BJValue = 1}
        else if(type.name == "Two"){self.BJValue = 2}
        else if(type.name == "Three"){self.BJValue = 3}
        else if(type.name == "Four"){self.BJValue = 4}
        else if(type.name == "Five"){self.BJValue = 5}
        else if(type.name == "Six"){self.BJValue = 6}
        else if(type.name == "Seven"){self.BJValue = 7}
        else if(type.name == "Eight"){self.BJValue = 8}
        else if(type.name == "Nine"){self.BJValue = 9}
        else if(type.name == "Ten"){self.BJValue = 10}
        else if(type.name == "Jack"){self.BJValue = 10}
        else if(type.name == "Queen"){self.BJValue = 10}
        else if(type.name == "King"){self.BJValue = 10}
        else{
            self.BJValue = -1
        }
        super.init(type: type)
    }
}