//
//  ViewController.swift
//  Xylophone
//
//  Created by murad on 10/03/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    var selectedSoundFileName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func notePressed(_ sender: UIButton) {
        selectedSoundFileName = soundArray[sender.tag]
        print(selectedSoundFileName)
        playSound()
    }
    
    func playSound() {
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            
        } catch {
            print("error")
        }
        
        audioPlayer.play()
    }
    
}

