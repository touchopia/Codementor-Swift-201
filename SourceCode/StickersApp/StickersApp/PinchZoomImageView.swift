//
//  PinchZoomImageView
//  PinchZoomImageView
//
//  Created by Phil Wright on 8/22/15.
//  Copyright © 2015 Touchopia, LLC. All rights reserved.
//

import UIKit

class PinchZoomImageView: UIImageView, UIGestureRecognizerDelegate {
    
    var originalTransform = CGAffineTransformIdentity
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.initialize()
    }
    
    func initialize() {
        
        // Important
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        self.exclusiveTouch = true

        self.contentMode = .ScaleAspectFit
        
        let tapGesture = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
        tapGesture.delegate = self
        self.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action:Selector("handlePan:"))
        panGesture.delegate = self
        self.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action:Selector("handlePinch:"))
        pinchGesture.delegate = self
        self.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action:Selector("handleRotate:"))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
    }

    // Mark - Gesture Methods
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        if let view = recognizer.view {
            view.superview?.bringSubviewToFront(self)
        }
    }

    func handlePan(recognizer:UIPanGestureRecognizer) {
        
        let translation = recognizer.translationInView(recognizer.view)
        
        if let view = recognizer.view {
            view.transform = CGAffineTransformTranslate(view.transform, translation.x, translation.y)
        }
        
        recognizer.setTranslation(CGPointZero, inView: self)
    }
    
    func handlePinch(recognizer : UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = CGAffineTransformScale(view.transform, recognizer.scale, recognizer.scale)
            recognizer.scale = 1
        }
    }
    
    func handleRotate(recognizer : UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = CGAffineTransformRotate(view.transform, recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        
    }
    
    // Needed to allow multiple touches (i.e. zoom and pinch)
    func gestureRecognizer(_: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
            return true
    }
}
