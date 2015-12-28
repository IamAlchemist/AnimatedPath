//
//  ViewController.swift
//  AnimatedPath
//
//  Created by Wizard Li on 12/28/15.
//  Copyright © 2015 morgenworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let animationLayer = CALayer()
    let pathLayer : CAShapeLayer? = nil
    
    func setupAnimationLayer() {
        animationLayer.backgroundColor = UIColor.blueColor().CGColor
    }
    
    func setupDrawingLayer() {
        
    }
    
    func startAnimation() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationLayer.frame = CGRect(x: 20, y: 64, width: CGRectGetWidth(view.bounds)-40, height: CGRectGetHeight(view.bounds)-84)
        
        setupAnimationLayer()
        
        view.layer.addSublayer(animationLayer)
    }
}

