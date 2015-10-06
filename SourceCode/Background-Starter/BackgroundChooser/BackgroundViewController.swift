//
//  ViewController.swift
//  BackgroundChooser
//
//  Created by Phil Wright on 10/1/15.
//  Copyright © 2015 Touchopia LLC. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController {
    
    var backgroundImageString : String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func chooseBackground(sender: UIButton) {
        print("chooseBackground")
        
        switch(sender.tag) {
            case 1: backgroundImageString = "blueBackground"
            case 2: backgroundImageString = "cityBackground"
            case 3: backgroundImageString = "greenBackground"
            case 4: backgroundImageString = "funBackground"
            case 5: backgroundImageString = "castleBackground"
        default: backgroundImageString = "redBackground"
        }
        self.performSegueWithIdentifier(kExitIdentifier, sender: self)
        
    }
}

