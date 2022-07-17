//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ankui on 7/10/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            var faceUpCardIndices: [Int] = []
            for idx in cards.indices {
                if cards[idx].isFaceUp {
                    faceUpCardIndices.append(idx)
                }
            }
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices[0]
            }
            return nil
        }
        set {
            for idx in cards.indices {
                if idx != newValue {
                    cards[idx].isFaceUp = false
                } else {
                    cards[idx].isFaceUp = true
                }
            }
        }
    }
    
    mutating func choose(_ card: Card) {
//        let chooseIdx = index(of: card)
//        var chooseCard = cards[chooseIdx]
//        chooseCard.isFaceUp.toggle()
  
        guard let chooseIdx = cards.firstIndex(where: { $0.id == card.id }),
              !cards[chooseIdx].isFaceUp, !cards[chooseIdx].isMatched
        else { return }
        if let matchIdx = indexOfTheOneAndOnlyFaceUpCard {
            if cards[chooseIdx].content == cards[matchIdx].content {
                cards[chooseIdx].isMatched = true
                cards[matchIdx].isMatched = true
            }
            cards[chooseIdx].isFaceUp = true
        } else {
            indexOfTheOneAndOnlyFaceUpCard = chooseIdx
        }
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
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: Int
    }
}
