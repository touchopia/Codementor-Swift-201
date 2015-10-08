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
            case 1: backgroundImageString = "castleBackground"
            case 2: backgroundImageString = "cityBackground"
            default: backgroundImageString = "funBackground"
        }
        self.performSegueWithIdentifier(kExitIdentifier, sender: self)
        
    }
}

