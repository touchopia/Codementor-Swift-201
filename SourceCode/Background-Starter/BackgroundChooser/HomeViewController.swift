//
//  HomeViewController.swift
//  BackgroundChooser
//
//  Created by Phil Wright on 10/1/15.
//  Copyright © 2015 Touchopia LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var backgroundImageView : UIImageView! = UIImageView(frame: CGRectZero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBackgroundImage("")
    }
    
    @IBAction func exitVC(segue: UIStoryboardSegue) {
        print("I am in the exitVC method")
        
        if segue.identifier == kExitIdentifier {
            
            if let controller = segue.sourceViewController as? BackgroundViewController {
                updateBackgroundImage(controller.backgroundImageString)
            }
        }
    }

//    @IBAction func unwindToVC(segue:UIStoryboardSegue) {
//        if segue.identifier == "unwindIdentifier" {
//            if let controller = segue.sourceViewController as? BackgroundViewController {
//                backgroundImageString = controller.backgroundImageString
//                updateBackgroundImage()
//            }
//        }
//    }
    
    func updateBackgroundImage(var imageName: String) {
        
        backgroundImageView.removeFromSuperview()
        
        if imageName == "" {
            imageName = "blueBackground"
        }
        
        backgroundImageView = UIImageView(image: UIImage(named: imageName))
        backgroundImageView?.frame = view.frame
        backgroundImageView?.contentMode = .ScaleAspectFill
        view.insertSubview(backgroundImageView!, atIndex: 0)
    }
    

}
