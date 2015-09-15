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
    
    var backgroundImagesArray : Array <UIImageView> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImagesArray = [
            UIImageView.init(image: UIImage.init(named: "funBackground")),
            UIImageView.init(image: UIImage.init(named: "cityBackground")),
            UIImageView.init(image: UIImage.init(named: "castleBackground"))
        ];
        
    }
    
    func createThumbnail(image: UIImage) -> UIImageView {
        
        // 1
        let imageView = UIImageView.init(image: image)
        
        // 2
        imageView.frame = CGRectMake(0,0,200,100)
        
        // 3
        imageView.contentMode = .ScaleAspectFit
        
        // 4
        imageView.image = image
        
        return imageView
    }


}
