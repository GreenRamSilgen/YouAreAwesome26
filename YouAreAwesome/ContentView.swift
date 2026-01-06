//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Kiran Shrestha on 1/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var sysImg = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: sysImg)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            HStack{
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
                let imageString1 = "sun.max.fill"
                let imageString2 = "hand.thumbsup"
                
                Button("Press Me!") {
                    if message == message2 {
                        message = message1
                        sysImg = imageString1
                    }
                    else {
                        message = message2
                        sysImg = imageString2
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
