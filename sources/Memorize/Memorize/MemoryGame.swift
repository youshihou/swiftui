//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ankui on 7/10/22.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    mutating func choose(_ card: Card) {
        let chooseIdx = index(of: card)
//        var chooseCard = cards[chooseIdx]
//        chooseCard.isFaceUp.toggle()
        cards[chooseIdx].isFaceUp.toggle()
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int {
        for idx in 0..<cards.count {
            if cards[idx].id == card.id {
                return idx
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for idx in 0..<numberOfPairsOfCards {
            let content = createCardContent(idx)
            cards.append(Card(content: content, id: idx * 2))
            cards.append(Card(content: content, id: idx * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
    }
}
