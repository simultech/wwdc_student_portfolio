//
//  Wisp.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 21/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class WispView : UIView {
    
    var wisp:UIImageView!
    var rotatespeed:NSNumber = 2;
    var maskImageView:UIImageView!
    
    override init(frame : CGRect) {
        super.init(frame : frame)
        commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        addImage()
        maskImageView = UIImageView(image: UIImage(named: "mask_image"))
        self.addSubview(maskImageView)
        self.sendSubviewToBack(maskImageView)
    }
    
    func addImage() {
        var image = UIImage(named: "wisp")
        self.wisp = UIImageView(image: image)
        var wispframe = self.wisp.frame
        self.wisp.alpha = 0.5
        wispframe.origin = CGPointMake(0 - wispframe.size.width/2, 0 - wispframe.size.height/2)
        wisp.frame = wispframe
        self.addSubview(self.wisp)
        var timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(self.rotatespeed), target: self, selector: Selector("animateImage"), userInfo: nil, repeats: true)
    }
    
    func animateImage() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(M_PI * 2.0)
        rotateAnimation.duration = CFTimeInterval(self.rotatespeed)
        self.layer.addAnimation(rotateAnimation, forKey: "rotateLayer")
        self.maskImageView.layer.addAnimation(rotateAnimation, forKey: "rotateLayer")
        
        let moveAnimation = CABasicAnimation(keyPath: "transform.scale")
        moveAnimation.duration = CFTimeInterval(NSNumber(float: Float(self.rotatespeed)/2))
        moveAnimation.autoreverses = true
        moveAnimation.repeatCount = 2
        moveAnimation.fromValue = 1
        moveAnimation.toValue = 0.4
        self.layer.addAnimation(moveAnimation, forKey: "moveLayer")
        self.maskImageView.layer.addAnimation(moveAnimation, forKey: "moveLayer")
    }
    
}