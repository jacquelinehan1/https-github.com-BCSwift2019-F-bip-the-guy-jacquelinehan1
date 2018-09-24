//
//  ViewController.swift
//  Bip the Guy
//
//  Created by Jacqueline Han on 9/23/18.
//  Copyright © 2018 Jacqueline Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageToPunch: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        print("Hey! You just pressed the image!")
    }
    
    
    
}

