//
//  ViewController.swift
//  StickersApp
//
//  Created by Phil Wright on 9/1/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toolbar: UIToolbar!
    
    var backgroundImageView : UIImageView?
    var backgroundImageString : String = ""
    
    var stickersArray : Array<UIImageView> = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageString = "blueBackground"
        updateBackgroundImage()
        
        view.bringSubviewToFront(toolbar)
    }
    
    override func viewDidAppear(animated: Bool) {
        updateBackgroundImage()
    }
    
    func updateBackgroundImage() {
        
        // is there a backgroundImageString available?
        
        backgroundImageView?.removeFromSuperview()
 
        backgroundImageView = UIImageView(image: UIImage(named:backgroundImageString))
        
        backgroundImageView?.frame = view.bounds
        backgroundImageView?.contentMode = .ScaleAspectFill
        view.insertSubview(backgroundImageView!, atIndex: 0)
    }

    @IBAction func actionAddImage(sender: AnyObject) {
        
        // 1
        let imageView = PinchZoomImageView(image: UIImage(named: "1"))
        
        // 2
        imageView.frame.origin = randomOriginPoint()
        
        // 3
        view.addSubview(imageView)
        
        // 4
        stickersArray.append(imageView)
        
        view.bringSubviewToFront(toolbar)
    }
    
    @IBAction func actionDeleteImage(sender: AnyObject) {

        // 1
        let stickersCount = stickersArray.count
        
        if(stickersCount > 0) {
            
            // 2
            if let imageView = stickersArray[0] as UIImageView? {
                imageView.removeFromSuperview()
                stickersArray.removeFirst()
            }
        }
        
    }
    
    func randomOriginPoint() -> CGPoint {
        let screenWidth = UInt32(self.view.frame.size.width / 2)
        
        return CGPointMake(CGFloat(arc4random_uniform(screenWidth)), CGFloat(arc4random_uniform(screenWidth)))
    }
    
    @IBAction func unwindToVC(segue:UIStoryboardSegue) {
        if segue.identifier == "unwindIdentifier" {
            if let controller = segue.sourceViewController as? BackgroundViewController {
                backgroundImageString = controller.backgroundImageString
                updateBackgroundImage()
            }
        }
    }

}

