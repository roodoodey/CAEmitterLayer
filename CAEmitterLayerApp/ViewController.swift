//
//  ViewController.swift
//  CAEmitterLayerApp
//
//  Created by Mathieu Skulason on 25/11/2018.
//  Copyright © 2018 FlowEducation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var particleImages = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for index in 1..<8 {
            if let image = UIImage(named: "StarParticle00\(index)") {
                particleImages.append(image)
            }
            
        }
        
        
    }
    
    func getRandomImage() -> UIImage {
        
        let randomIndex = arc4random_uniform(particleImages.count + 1)
        
        return particleImages[randomIndex]
    }


}

