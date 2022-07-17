//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ankui on 7/10/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = [
        "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑",
        "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽",
        "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚨", "🚔",
        "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋",
        "🚞", "🚝", "🚄", "🚅", "🚈", "🚂", "🚆", "🚇",
        "🚊", "🚉", "✈️", "🛫", "🛬", "🛩", "💺", "🛰",
        "🚀", "🛸", "🚁", "🛶", "⛵️", "🚤", "🛥", "🛳",
        "⛴", "🚢", "⚓️", "🪝", "⛽️", "🚧", "🚦", "🚥",
    ]

    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { idx in
           emojis[idx]
       }
    }
  
    @Published private var model = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
