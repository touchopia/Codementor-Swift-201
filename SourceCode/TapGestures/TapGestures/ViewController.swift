//
//  ViewController.swift
//  TapGestures
//
//  Created by Phil Wright on 9/14/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var characterImageView: UIImageView!

    var characterOneTapGesture: UITapGestureRecognizer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterImageView.userInteractionEnabled = true
        
        let characterOneTapGesture = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
        characterOneTapGesture.delegate = self
        characterImageView.addGestureRecognizer(characterOneTapGesture)
    
    }

    func handleTap(sender: AnyObject) {
        debugPrint("tapped on one")
    }
    
}

