//
//  Deck.swift
//  Card Game Suite
//
//  Created by Jason Zou on 7/10/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import Foundation
import UIKit

class Deck{
    var deck : [Card]
    
    init(){
        let d1 = Card(name: "Ace", suite: "Diamonds", image: UIImage(named: "d1.png")!)
        let d2 = Card(name: "Two", suite: "Diamonds", image: UIImage(named: "d2.png")!)
        let d3 = Card(name: "Three", suite: "Diamonds", image: UIImage(named: "d3.png")!)
        let d4 = Card(name: "Four", suite: "Diamonds" , image: UIImage(named: "d4.png")!)
        let d5 = Card(name: "Five", suite: "Diamonds", image: UIImage(named: "d5.png")!)
        let d6 = Card(name: "Six", suite: "Diamonds", image: UIImage(named: "d6.png")!)
        let d7 = Card(name: "Seven", suite: "Diamonds", image: UIImage(named: "d7.png")!)
        let d8 = Card(name: "Eight", suite: "Diamonds", image: UIImage(named: "d8.png")!)
        let d9 = Card(name: "Nine", suite: "Diamonds", image: UIImage(named: "d9.png")!)
        let d10 = Card(name: "Ten", suite: "Diamonds", image: UIImage(named: "d10.png")!)
        let dj = Card(name: "Jack", suite: "Diamonds", image: UIImage(named: "dj.png")!)
        let dq = Card(name: "Queen", suite: "Diamonds", image: UIImage(named: "dq.png")!)
        let dk = Card(name: "King", suite: "Diamonds", image: UIImage(named: "dk.png")!)
        
        let c1 = Card(name: "Ace", suite: "Clovers", image: UIImage(named: "c1.png")!)
        let c2 = Card(name: "Two", suite: "Clovers", image: UIImage(named: "c2.png")!)
        let c3 = Card(name: "Three", suite: "Clovers", image: UIImage(named: "c3.png")!)
        let c4 = Card(name: "Four", suite: "Clovers", image: UIImage(named: "c4.png")!)
        let c5 = Card(name: "Five", suite: "Clovers", image: UIImage(named: "c5.png")!)
        let c6 = Card(name: "Six", suite: "Clovers", image: UIImage(named: "c6.png")!)
        let c7 = Card(name: "Seven", suite: "Clovers", image: UIImage(named: "c7.png")!)
        let c8 = Card(name: "Eight", suite: "Clovers", image: UIImage(named: "c8.png")!)
        let c9 = Card(name: "Nine", suite: "Clovers", image: UIImage(named: "c9.png")!)
        let c10 = Card(name: "Ten", suite: "Clovers", image: UIImage(named: "c10.png")!)
        let cj = Card(name: "Jack", suite: "Clovers", image: UIImage(named: "cj.png")!)
        let cq = Card(name: "Queen", suite: "Clovers", image: UIImage(named: "cq.png")!)
        let ck = Card(name: "King", suite: "Clovers", image: UIImage(named: "ck.png")!)
        
        let h1 = Card(name: "Ace", suite: "Hearts", image: UIImage(named: "h1.png")!)
        let h2 = Card(name: "Two", suite: "Hearts", image: UIImage(named: "h2.png")!)
        let h3 = Card(name: "Three", suite: "Hearts", image: UIImage(named: "h3.png")!)
        let h4 = Card(name: "Four", suite: "Hearts", image: UIImage(named: "h4.png")!)
        let h5 = Card(name: "Five", suite: "Hearts", image: UIImage(named: "h5.png")!)
        let h6 = Card(name: "Six", suite: "Hearts", image: UIImage(named: "h6.png")!)
        let h7 = Card(name: "Seven", suite: "Hearts", image: UIImage(named: "h7.png")!)
        let h8 = Card(name: "Eight", suite: "Hearts", image: UIImage(named: "h8.png")!)
        let h9 = Card(name: "Nine", suite: "Hearts", image: UIImage(named: "h9.png")!)
        let h10 = Card(name: "Ten", suite: "Hearts", image: UIImage(named: "h10.png")!)
        let hj = Card(name: "Jack", suite: "Hearts", image: UIImage(named: "hj.png")!)
        let hq = Card(name: "Queen", suite: "Hearts", image: UIImage(named: "hq.png")!)
        let hk = Card(name: "King", suite: "Hearts", image: UIImage(named: "hk.png")!)
        
        let s1 = Card(name: "Ace", suite: "Spades", image: UIImage(named: "s1.png")!)
        let s2 = Card(name: "Two", suite: "Spades", image: UIImage(named: "s2.png")!)
        let s3 = Card(name: "Three", suite: "Spades", image: UIImage(named: "s3.png")!)
        let s4 = Card(name: "Four", suite: "Spades", image: UIImage(named: "s4.png")!)
        let s5 = Card(name: "Five", suite: "Spades", image: UIImage(named: "s5.png")!)
        let s6 = Card(name: "Six", suite: "Spades", image: UIImage(named: "s6.png")!)
        let s7 = Card(name: "Seven", suite: "Spades", image: UIImage(named: "s7.png")!)
        let s8 = Card(name: "Eight", suite: "Spades", image: UIImage(named: "s8.png")!)
        let s9 = Card(name: "Nine", suite: "Spades", image: UIImage(named: "s9.png")!)
        let s10 = Card(name: "Ten", suite: "Spades", image: UIImage(named: "s10.png")!)
        let sj = Card(name: "Jack", suite: "Spades", image: UIImage(named: "sj.png")!)
        let sq = Card(name: "Queen", suite: "Spades", image: UIImage(named: "sq.png")!)
        let sk = Card(name: "King", suite: "Spades", image: UIImage(named: "sk.png")!)
        
        deck = [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,dj,dq,dk,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,cj,cq,ck,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,hj,hq,hk,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,sj,sq,sk]
    }
}