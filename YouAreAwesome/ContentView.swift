//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Kiran Shrestha on 1/5/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    let numberOfImages = 10
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
    @State private var messageNumber : Int = -1
    @State private var imageNumber : Int = -1
    @State private var soundNumber : Int = -1
    @State private var audioPlayer : AVAudioPlayer!
    @State private var soundIsOn : Bool = true
    
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
            
            Spacer()
            
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
                
                let sound0 = "sound0"
                let sound1 = "sound1"
                let sound2 = "sound2"
                let sound3 = "sound3"
                let sound4 = "sound4"
                let sound5 = "sound5"
                let sounds = [ sound0, sound1, sound2, sound3, sound4, sound5]
                
                HStack {
                    Text("Sound On:")
                    Toggle("", isOn: $soundIsOn)
                        .labelsHidden()
                        .border(.blue)
                        .onChange(of: soundIsOn) { oldValue, newValue in
                            if audioPlayer != nil, audioPlayer.isPlaying {
                                audioPlayer.stop()
                            }
                        }
                    
                    Spacer()
                    
                    Button("Press Me!") {
                        //TODO: - Update the imageName variable -
                        
                        messageNumber = nonRepeatingRandom(upperBound: numberOfImages-1, lastNumber: messageNumber)
                        message = messages[messageNumber]
                        
                        imageNumber = nonRepeatingRandom(upperBound: numberOfImages-1, lastNumber: imageNumber)
                        imageName = "image\(imageNumber)"
                        
                        soundNumber = nonRepeatingRandom(upperBound: sounds.count, lastNumber: soundNumber)
                        
                        if soundIsOn {
                            playSound(soundName: "sound\(soundNumber)")
                        }
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.accentColor)
        }
        .padding()
    }
    
    func playSound(soundName : String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Failed to create sound file")
            return
        }
        if audioPlayer != nil, audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        }
        catch {
            print("😡 Fail creating audio player. See details: \(error.localizedDescription)")
        }
    }
    
    func nonRepeatingRandom(upperBound : Int, lastNumber : Int) -> Int {
        var newNumber : Int
        repeat {
            newNumber = Int.random(in: 0..<upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}
#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
