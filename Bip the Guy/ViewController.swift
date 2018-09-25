//
//  ViewController.swift
//  Bip the Guy
//
//  Created by Jacqueline Han on 9/23/18.
//  Copyright © 2018 Jacqueline Han. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var ImageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func animateImage() {
        let bounds = self.ImageToPunch.bounds
        let shrinkValue: CGFloat = 60
        
    // shrink our imageToPunch by 60 pixels
        self.ImageToPunch.bounds = CGRect(x: self.ImageToPunch.bounds.origin.x + shrinkValue, y: self.ImageToPunch.bounds.origin.y + shrinkValue, width: self.ImageToPunch.bounds.size.width - shrinkValue, height: self.ImageToPunch.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.ImageToPunch.bounds = bounds }, completion: nil)
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        // Can we load in the file soundName?
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data); audioPlayer.play()
            } catch {
                print("ERROR: data in \(soundName) couldn't be played as a sound")
            }
        } else {
            print ("ERROR: file\(soundName) didn't load")
        }
    }
    
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
    
    
    
}

