//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ankui on 7/10/22.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for idx in 0..<numberOfPairsOfCards {
            let content = createCardContent(idx)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
