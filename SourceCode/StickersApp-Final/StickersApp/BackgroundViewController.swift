//
//  BackgroundViewController.swift
//  StickersApp
//
//  Created by Phil Wright on 9/5/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit
import ImageIO

class BackgroundViewController: UIViewController {
    
    var backgroundImageString : String = ""

    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func chooseBackground(sender: UIButton) {
        
        if sender.isEqual(buttonOne) {
            backgroundImageString = "funBackground"
        }
        else if sender.isEqual(buttonTwo) {
            backgroundImageString = "greenBackground"
        }
        
        self.performSegueWithIdentifier("unwindIdentifier", sender: self)
    }
    
}
