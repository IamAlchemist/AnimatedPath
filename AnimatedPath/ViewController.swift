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
    var pathLayer : CAShapeLayer? = nil
    
    func setupAnimationLayer() {
        
    }
    
    func setupDrawingLayer() {
        if (self.pathLayer != nil) {
            self.pathLayer = nil
        }
        
        let pathRect = CGRectInset(animationLayer.bounds, 100, 100)
        let bottomLeft = CGPoint(x: CGRectGetMinX(pathRect), y: CGRectGetMinY(pathRect))
        let topLeft = CGPoint(x: CGRectGetMinX(pathRect), y: CGRectGetMinY(pathRect) + CGRectGetHeight(pathRect) * 2.0/3.0)
        let bottomRight = CGPoint(x: CGRectGetMaxX(pathRect), y: CGRectGetMinY(pathRect))
        let topRight = CGPoint(x: CGRectGetMaxX(pathRect), y: CGRectGetMinY(pathRect) + CGRectGetHeight(pathRect) * 2.0/3.0)
        let rootTip = CGPoint(x: CGRectGetMidX(pathRect), y: CGRectGetMaxY(pathRect))
        
        let path = UIBezierPath()
        path.moveToPoint(bottomLeft)
        path.addLineToPoint(topLeft)
        path.addLineToPoint(rootTip)
        path.addLineToPoint(topRight)
        path.addLineToPoint(topLeft)
        path.addLineToPoint(bottomRight)
        path.addLineToPoint(topRight)
        path.addLineToPoint(bottomLeft)
        path.addLineToPoint(bottomRight)
        
        let pathLayer = CAShapeLayer()
        pathLayer.frame = animationLayer.bounds
        pathLayer.bounds = pathRect
        pathLayer.geometryFlipped = true
        pathLayer.path = path.CGPath
        pathLayer.strokeColor = UIColor.blackColor().CGColor
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 10
        pathLayer.lineJoin = kCALineJoinBevel
        
        animationLayer.addSublayer(pathLayer)
        
        self.pathLayer = pathLayer
    }
    
    func startAnimation() {
        if let layer = pathLayer {
            layer.removeAllAnimations()
        }
        
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd");
        pathAnimation.duration = 10
        pathAnimation.fromValue = NSNumber(float: 1)
        pathAnimation.toValue = NSNumber(float: 0)
        pathLayer?.addAnimation(pathAnimation, forKey: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationLayer.frame = CGRect(x: 20, y: 64, width: CGRectGetWidth(view.bounds)-40, height: CGRectGetHeight(view.bounds)-84)
        
        setupAnimationLayer()
        view.layer.addSublayer(animationLayer)
        
        setupDrawingLayer()
        
        startAnimation()
    }
}

