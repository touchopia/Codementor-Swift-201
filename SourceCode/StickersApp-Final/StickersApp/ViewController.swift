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
    
    var stickersArray : Array<UIImageView> = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView = UIImageView(image: UIImage(named:"blueBackground"))
        backgroundImageView.frame = view.bounds
        backgroundImageView.contentMode = .ScaleAspectFill
        view.addSubview(backgroundImageView)
        view.bringSubviewToFront(toolbar)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomOriginPoint() -> CGPoint {
        let screenWidth = UInt32(self.view.frame.size.width / 2)
        
        return CGPointMake(CGFloat(arc4random_uniform(screenWidth)), CGFloat(arc4random_uniform(screenWidth)))
    }

}

