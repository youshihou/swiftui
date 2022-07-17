//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ankui on 7/9/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
