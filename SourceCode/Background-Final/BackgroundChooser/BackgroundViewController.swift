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
        
        switch(sender.tag) {
            case 1: backgroundImageString = "redBackground"
            case 2: backgroundImageString = "blueBackground"
            case 3: backgroundImageString = "greenBackground"
            case 4: backgroundImageString = "castleBackground"
            case 5: backgroundImageString = "funBackground"
            default: backgroundImageString = "cityBackground"
        }
        self.performSegueWithIdentifier("unwindIdentifier", sender: self)
    }
}

