//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Yuhang Zhou on 4/7/24.
//

import Foundation

struct MemorizeGame<CardContent> {
     
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
