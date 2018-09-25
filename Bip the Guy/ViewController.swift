//
//  ViewController.swift
//  Bip the Guy
//
//  Created by Jacqueline Han on 9/23/18.
//  Copyright © 2018 Jacqueline Han. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    var imagePicker = UIImagePickerController()
    
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
                print("ERROR: data in \(soundName) couldn't be played as a file")
            }
        } else {
            print ("ERROR: Could not load dates from file\(soundName)")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        ImageToPunch.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){ dismiss(animated: true, completion: nil)
}
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func libraryPressed(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion:nil)
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
        imagePicker.sourceType = .camera
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion:nil)
        } else {
            showAlert(title: "Camera Not Available", message:"There is not a camera available on this device.")
        }
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
    
    
    


}
