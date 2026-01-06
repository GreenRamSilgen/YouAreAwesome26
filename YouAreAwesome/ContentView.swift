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
            
            Image(sysImg)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
            
            HStack{
                let image0 = "image0"
                let message0 = "You Are Awesome!"
                let image1 = "image1"
                let message1 = "You Are Greaet!"
                let image2 = "image2"
                let image3 = "image3"
                let image4 = "image4"
                let image5 = "image5"
                let image6 = "image6"
                let image7 = "image7"
                let image8 = "image8"
                let image9 = "image9"
                
                Button("Press Me!") {
                    message = message == message0 ? message1 : message0
                    sysImg = sysImg == image1 ? image0 : image1
                    
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
