//
//  SoundPlayer.swift
//  Devote
//
//  Created by Adriancys Jesus Villegas Toro on 24/8/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    
    if let path = Bundle.main.path(forResource: sound, ofType: sound) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("Could not find and play the sound file")
        }
    }
}
