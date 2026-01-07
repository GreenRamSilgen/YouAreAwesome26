//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Kiran Shrestha on 1/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber : Int = -1
    @State private var lastImageNumber : Int = -1
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(height: 100)
                .minimumScaleFactor(0.5)
                .animation(.easeInOut(duration: 0.2), value: message)
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            HStack{
                let message0 = "If a woodchuck could chuck wood. Would a woodchuck chuck wood?"
                let message1 = "You Are Great!"
                let message2 = "You Are Alright!"
                let message3 = "You Are Noice!"
                let message4 = "You Are Cool!"
                let message5 = "You Are Fantastic!"
                let message6 = "You Are Super!"
                let message7 = "You Are Amazing!"
                let message8 = "You Are Dazzaling!"
                let message9 = "You Are Wow!"
                let messages = [
                    message0,
                    message1,
                    message2,
                    message3,
                    message4,
                    message5,
                    message6,
                    message7,
                    message8,
                    message9
                ]
                Button("Press Me!") {
                    //TODO: - Update the imageName variable -
                    var messageNumber : Int
                    repeat {
                        messageNumber = Int.random(in: 0..<messages.count)
                    } while lastMessageNumber == messageNumber
                    
                    message = messages[messageNumber]
                    lastMessageNumber = messageNumber
                    
                    
                    var imageNumber : Int
                    repeat {
                        imageNumber = Int.random(in: 0...9)
                    } while lastImageNumber == imageNumber
                    imageName = "image\(imageNumber)"
                    lastImageNumber = imageNumber
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
