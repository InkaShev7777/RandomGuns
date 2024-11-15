//
//  SoundManager.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import Foundation
import AVFAudio

class SoundManager {
    private var audioPlayer: AVAudioPlayer?
    static let shared = SoundManager()
    
    func shoot() {
        playSound(nameSound: "shot")
    }
    
    func emptyShoot() {
        playSound(nameSound: "empty-gun-shot")
    }
    
    func reelSpin() {
        playSound(nameSound: "reel-spin")
    }
    
    func soundOfCard() {
        playSound(nameSound: "card-sound")
    }
    
    func kingTableCard() {
        playSound(nameSound: "king-table")
    }
    
    func queenTableCard() {
        playSound(nameSound: "queen-table")
    }
    
    func aceTableCard() {
        playSound(nameSound: "ace-table")
    }
    
    private func playSound(nameSound: String) {
            guard let soundURL = Bundle.main.url(forResource: nameSound, withExtension: "mp3") else {
                print("DEBUG: Sound file not found.")
                return
            }

            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("DEBUG: Failed to play sound: \(error.localizedDescription)")
            }
        }
}
