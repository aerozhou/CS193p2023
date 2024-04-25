//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Yuhang Zhou on 3/22/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    var viewModel: EmojiMemoryGame
    
    let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮",
                  "🐷", "🐸", "🐵", "🐔", "🦄", "🐝", "🐠", "🦀", "🐬", "🐳", "🐿️", "🦚"]
    // WHY @State
    @State var emoji_count = 4
    
    var body: some View {
        ScrollView {
            
            cards
            
            Spacer()
            
            cardCountAdjuster

        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self) {index in
                CardView(name: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    var cardShuffer: some View {
        Button(action: {
            
        }, label: {
            HStack {
                Image(systemName: "circle.circle")
                Text("Shuffle")
            }
    })
    }
    
    var cardRemover: some View {
        Button(action: {
            if emoji_count > 1 {
                emoji_count -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
            Text("Minus")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            if emoji_count < emojis.count {
                emoji_count += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
            Text("Add")
        })
    }
    
}

struct CardView: View {
    
    var name: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                Text(name)
                    .font(.system(size: 50))
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(style: StrokeStyle(lineWidth: 10))
            } else {
                RoundedRectangle(cornerRadius: 15)
                    .fill()
            }
        }
        .foregroundColor(.orange)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}

