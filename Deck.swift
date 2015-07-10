//
//  Deck.swift
//  Card Game Suite
//
//  Created by Jason Zou on 7/10/15.
//  Copyright © 2015 iOS Mobile Makers Class. All rights reserved.
//

import Foundation

class Deck{
    var deck : [Card]
    
    init(){
        deck.append(Card("One", suite: "Diamonds", image:"d1.png"))
        deck.append(Card("Two", suite: "Diamonds", image:"d2.png"))
        deck.append(Card("Three", suite: "Diamonds", image:"d3.png"))
        deck.append(Card("Four", suite: "Diamonds", image:"d4.png"))
        deck.append(Card("Five", suite: "Diamonds", image:"d5.png"))
        deck.append(Card("Six", suite: "Diamonds", image:"d6.png"))
        deck.append(Card("Seven", suite: "Diamonds", image:"d7.png"))
        deck.append(Card("Eight", suite: "Diamonds", image:"d8.png"))
        deck.append(Card("Nine", suite: "Diamonds", image:"d9.png"))
        deck.append(Card("Ten", suite: "Diamonds", image:"d10.png"))
        deck.append(Card("Jack", suite: "Diamonds", image:"dj.png"))
        deck.append(Card("Queen", suite: "Diamonds", image:"dq.png"))
        deck.append(Card("King", suite: "Diamonds", image:"dk.png"))
        deck.append(Card("One", suite: "Clovers", image:"c1.png"))
        deck.append(Card("Two", suite: "Clovers", image:"c2.png"))
        deck.append(Card("Three", suite: "Clovers", image:"c3.png"))
        deck.append(Card("Four", suite: "Clovers", image:"c4.png"))
        deck.append(Card("Five", suite: "Clovers", image:"c5.png"))
        deck.append(Card("Six", suite: "Clovers", image:"c6.png"))
        deck.append(Card("Seven", suite: "Clovers", image:"c7.png"))
        deck.append(Card("Eight", suite: "Clovers", image:"c8.png"))
        deck.append(Card("Nine", suite: "Clovers", image:"c9.png"))
        deck.append(Card("Ten", suite: "Clovers", image:"c10.png"))
        deck.append(Card("Jack", suite: "Clovers", image:"cj.png"))
        deck.append(Card("Queen", suite: "Clovers", image:"cq.png"))
        deck.append(Card("King", suite: "Clovers", image:"ck.png"))
        deck.append(Card("One", suite: "Hearts", image:"h1.png"))
        deck.append(Card("Two", suite: "Hearts", image:"h2.png"))
        deck.append(Card("Three", suite: "Hearts", image:"h3.png"))
        deck.append(Card("Four", suite: "Hearts", image:"h4.png"))
        deck.append(Card("Five", suite: "Hearts", image:"h5.png"))
        deck.append(Card("Six", suite: "Hearts", image:"h6.png"))
        deck.append(Card("Seven", suite: "Hearts", image:"h7.png"))
        deck.append(Card("Eight", suite: "Hearts", image:"h8.png"))
        deck.append(Card("Nine", suite: "Hearts", image:"h9.png"))
        deck.append(Card("Ten", suite: "Hearts", image:"h10.png"))
        deck.append(Card("Jack", suite: "Hearts", image:"hj.png"))
        deck.append(Card("Queen", suite: "Hearts", image:"hq.png"))
        deck.append(Card("King", suite: "Hearts", image:"hk.png"))
        deck.append(Card("One", suite: "Spades", image:"s1.png"))
        deck.append(Card("Two", suite: "Spades", image:"s2.png"))
        deck.append(Card("Three", suite: "Spades", image:"s3.png"))
        deck.append(Card("Four", suite: "Spades", image:"s4.png"))
        deck.append(Card("Five", suite: "Spades", image:"s5.png"))
        deck.append(Card("Six", suite: "Spades", image:"s6.png"))
        deck.append(Card("Seven", suite: "Spades", image:"s7.png"))
        deck.append(Card("Eight", suite: "Spades", image:"s8.png"))
        deck.append(Card("Nine", suite: "Spades", image:"s9.png"))
        deck.append(Card("Ten", suite: "Spades", image:"s10.png"))
        deck.append(Card("Jack", suite: "Spades", image:"sj.png"))
        deck.append(Card("Queen", suite: "Spades", image:"sq.png"))
        deck.append(Card("King", suite: "Spades", image:"sk.png"))
    }
}