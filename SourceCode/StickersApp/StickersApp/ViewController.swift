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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView = UIImageView(image: UIImage(named:"blueBackground"))
        backgroundImageView.frame = view.bounds
        backgroundImageView.contentMode = .ScaleAspectFill
        view.addSubview(backgroundImageView)
        view.bringSubviewToFront(toolbar)
    }

    @IBAction func actionAddImage(sender: AnyObject) {
        let imageView = PinchZoomImageView(image: UIImage(named: "1"))
        imageView.frame.origin = randomOriginPoint()
        view.addSubview(imageView)
        view.bringSubviewToFront(toolbar)
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

