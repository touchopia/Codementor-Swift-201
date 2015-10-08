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
    
    @IBAction func exitVC(segue: UIStoryboardSegue) {
        if segue.identifier == kExitIdentifier {
            
            if let controller = segue.sourceViewController as? BackgroundViewController {
                backgroundImageString = controller.backgroundImageString
                updateBackgroundImage()
            }
        }
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
        
        // 1 choose random image between 1 and 7
        
        let randomNumber = RandomInt(min: 1, max: 7)
        //let randomNumber = Int(arc4random_uniform(6) +  1)
        
        // 2 Use String Interpolation to get the image
        
        let imageView = PinchZoomImageView(image: UIImage(named: "\(randomNumber)"))
        
        // 3
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
    
    func RandomInt(min min: Int, max: Int) -> Int {
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    @IBAction func screenshot(sender: AnyObject) {
        // Hide the toolbar first!
        toolbar.hidden = true
        navigationController?.navigationBarHidden = true
        
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        toolbar.hidden = false
        navigationController?.navigationBarHidden = false
        
        let alertController = UIAlertController(title: "Image Saved", message:"Screen Saved to Photo Gallery", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func randomOriginPoint() -> CGPoint {
        let screenWidth = UInt32(self.view.frame.size.width / 3)
        return CGPointMake(CGFloat(arc4random_uniform(screenWidth)), CGFloat(arc4random_uniform(screenWidth)))
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == kChooseBackground {
            if let controller = segue.sourceViewController as? BackgroundViewController {
                backgroundImageString = controller.backgroundImageString
                updateBackgroundImage()
            }

        }
    }
}

