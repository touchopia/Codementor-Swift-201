//
//  ViewController.swift
//  StickersApp
//
//  Created by Phil Wright on 9/1/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageView = UIImageView(image: UIImage(named:"funBackground"))
        backgroundImageView.contentMode = .ScaleAspectFit
        view.addSubview(backgroundImageView)
        
        let imageView = PinchZoomImageView(image: UIImage(named: "2"))
        let imageView1 = PinchZoomImageView(image: UIImage(named: "3"))
        let imageView2 = PinchZoomImageView(image: UIImage(named: "4"))
        
    
        imageView.frame.origin = randomOriginPoint()
        imageView1.frame.origin = randomOriginPoint()
        imageView2.frame.origin = randomOriginPoint()
        
        view.addSubview(imageView)
        view.addSubview(imageView1)
        view.addSubview(imageView2)
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

