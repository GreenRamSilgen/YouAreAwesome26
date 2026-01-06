//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Kiran Shrestha on 1/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I Am A Programmer!"
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Button("Click Me!") {
                message = "Awesome"
                print(message)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
