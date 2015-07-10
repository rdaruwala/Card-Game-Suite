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
}