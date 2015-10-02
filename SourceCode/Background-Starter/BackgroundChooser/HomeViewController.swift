//
//  HomeViewController.swift
//  BackgroundChooser
//
//  Created by Phil Wright on 10/1/15.
//  Copyright © 2015 Touchopia LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var backgroundImageString : String = ""
    var backgroundImageView : UIImageView! = UIImageView(frame: CGRectZero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBackgroundImage()
    }

    @IBAction func unwindToVC(segue:UIStoryboardSegue) {
        if segue.identifier == "unwindIdentifier" {
            if let controller = segue.sourceViewController as? BackgroundViewController {
                backgroundImageString = controller.backgroundImageString
                updateBackgroundImage()
            }
        }
    }
    
    func updateBackgroundImage() {
        
        backgroundImageView.removeFromSuperview()
        
        if backgroundImageString == "" {
            backgroundImageString = "blueBackground"
        }
        
        
        backgroundImageView = UIImageView(image: UIImage(named: backgroundImageString))
        backgroundImageView?.frame = view.frame
        backgroundImageView?.contentMode = .ScaleAspectFill
        
        view.insertSubview(backgroundImageView!, atIndex: 0)
    }
    

}
