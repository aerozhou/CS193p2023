//
//  ContentView.swift
//  Memorize
//
//  Created by Yuhang Zhou on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮",
                  "🐷", "🐸", "🐵", "🐔", "🦄", "🐝", "🐠", "🦀", "🐬", "🐳", "🐿️", "🦚"]
    // WHY @State
    @State var emoji_count = 4
    
    var body: some View {
        VStack {
            
            HStack {
                ForEach(0..<emoji_count, id: \.self) {index in
                    CardView(name: emojis[index])
                }
            }
            .foregroundColor(.orange)
            
            Spacer()
            
            HStack {
                HStack {
                    cardRemover
                    Spacer()
                    cardAdder
                }
            }
        }
        .padding()
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
    ContentView()
}

