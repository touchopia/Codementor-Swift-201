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
        if sender.tag == 1 {
            backgroundImageString = "castleBackground"
        }
        else if sender.tag == 2 {
            backgroundImageString = "funBackground"
        }
        else {
            backgroundImageString = "cityBackground"
        }
        
        self.performSegueWithIdentifier("unwindIdentifier", sender: self)
    }
}

