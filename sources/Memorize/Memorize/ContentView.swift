//
//  ContentView.swift
//  Memorize
//
//  Created by Ankui on 7/9/22.
//

import SwiftUI

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView: View {
    var emojis = [
        "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑",
        "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽",
        "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚨", "🚔",
        "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋",
        "🚞", "🚝", "🚄", "🚅", "🚈", "🚂", "🚆", "🚇",
        "🚊", "🚉", "✈️", "🛫", "🛬", "🛩", "💺", "🛰",
        "🚀", "🛸", "🚁", "🛶", "⛵️", "🚤", "🛥", "🛳",
        "⛴", "🚢", "⚓️", "🪝", "⛽️", "🚧", "🚦", "🚥",
    ]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            HStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                Button {
                    guard emojiCount > 1 else { return }
                    emojiCount -= 1
                } label: {
                    Image(systemName: "minus.circle")
                        .font(.largeTitle)
                }
                Spacer()
                Button {
                    guard emojiCount < emojis.count else { return }
                    emojiCount += 1
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.largeTitle)
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
