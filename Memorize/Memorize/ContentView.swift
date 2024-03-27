//
//  ContentView.swift
//  Memorize
//
//  Created by Yuhang Zhou on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(name: "🐶")
            CardView(name: "🐱")
            CardView(name: "🐭")
            CardView(name: "🐰")
        }
        .padding()
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
            self.isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    ContentView()
}

