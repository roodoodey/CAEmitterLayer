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
    var emitter: CAEmitterLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for index in 1..<8 {
            if let image = UIImage(named: "StarParticle00\(index)") {
                particleImages.append(image)
            }
            
        }
        
        // Button pressed to make the emitter emit the particles
        let button = UIButton(frame: CGRect(x: view.frame.width * 0.5 - 60, y: view.frame.height * 0.5 - 40, width: 120, height: 80))
        button.setTitle("Emit!", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(addEmitter), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc func addEmitter() {
        
        // IF an emitter already exists remove it.
        if emitter?.superlayer != nil {
            emitter?.removeFromSuperlayer()
        }
        
        emitter = CAEmitterLayer()
        emitter?.emitterShape = CAEmitterLayerEmitterShape.point
        emitter?.position = CGPoint(x: self.view.frame.width * 0.5, y: self.view.frame.height * 0.5)
        
        var cells = [CAEmitterCell]()
        for _ in 0..<40 {
            let cell = CAEmitterCell()
            cell.birthRate = 1
            cell.lifetime = 3
            cell.lifetimeRange = 0.5
            cell.velocity = 500
            cell.velocityRange = 100
            cell.emissionRange = 2 * CGFloat(Double.pi)
            cell.contents = getRandomImage().cgImage
            cell.scale = 1
            cell.scaleRange = 0.5
            cells.append(cell)
        }
        
        emitter?.emitterCells = cells
        
        view.layer.addSublayer( emitter! )
        
    }
    
    func getRandomImage() -> UIImage {
        
        let upperBound = UInt32(particleImages.count)
        let randomIndex = Int(arc4random_uniform( upperBound ))
        
        return particleImages[randomIndex]
    }


}

