//
//  ContentView.swift
//  Shared
//
//  Created by Nicolas Tedori on 11/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = ["🚗", "🚕", "🚙", "🏎", "🚎", "🚌", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🛺", "🚡", "🚠", "🚟"]
    @State var emojiCount = 4
    var body: some View {
        VStack {
            Text("Memorize")
                .fontWeight(.black)
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                // button to increase/decrease the number of cards
//                remove
//                Spacer()
//                add
                
                // buttons to select a theme
                vehicleTheme
                Spacer()
                sportsTheme
                Spacer()
                techTheme
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
//    var remove: some View {
//        Button(action: {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        }, label: {
//            Image(systemName: "minus.circle")
//
//        })
//    }
//
//    var add: some View {
//        Button(action: {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        }, label: {
//            Image(systemName: "plus.circle")
//        })
//    }
    
    var vehicleTheme: some View {
        let vehicleEmojis: [String] = ["🚗", "🚕", "🚙", "🏎", "🚎", "🚌", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🛺", "🚡", "🚠", "🚟"]
        
        return Button (action: {
            emojis = vehicleEmojis.shuffled()
            emojiCount = Int.random(in: 4...vehicleEmojis.count)
        }, label: {
            VStack {
                Image(systemName: "car.fill").font(.largeTitle)
                Text("Vehicles")
            }
        })
    }

    var sportsTheme: some View {
        let sportsEmojis: [String] = ["🧗‍♀️", "🏊‍♀️", "🏄‍♀️", "🏇", "🏌️‍♀️", "🤾‍♀️", "🤺", "⛹️‍♀️", "🤸‍♀️", "🤼‍♀️", "🏋️‍♀️", "🪂", "🏂", "⛷"]
        
        return Button (action: {
            emojis = sportsEmojis.shuffled()
            emojiCount = Int.random(in: 4...sportsEmojis.count)
        }, label: {
            VStack {
                Image(systemName: "figure.walk").font(.largeTitle)
                Text("Athletics")
            }
        })
    }

    var techTheme: some View {
        let techEmojis: [String] = ["⌚️", "📱", "💻", "🖥", "🕹", "📺", "📷", "📹"]
        
        return Button (action: {
            emojis = techEmojis.shuffled()
            emojiCount = Int.random(in: 4...techEmojis.count)
        }, label: {
            VStack {
                Image(systemName: "desktopcomputer").font(.largeTitle)
                Text("Technology")
            }
        })
    }
}

// represents an individual card in the game
struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true // @State now a pointer to elsewhere
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20) // let == constants
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
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
