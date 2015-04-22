//
//  TransitionManager.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 22/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate  {
    
    private var presenting = true
    private var sidebarwidth = CGFloat(50.0)
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        var offScreenRight = CGAffineTransformMakeTranslation(container.frame.width, 0)
        var offScreenLeft = CGAffineTransformMakeTranslation(-container.frame.width+self.sidebarwidth, 0)
        
        if (self.presenting){
            toView.transform = offScreenRight
        } else {
            toView.transform = self.home_translation()
        }
        
        if (self.presenting){
            container.addSubview(fromView)
            container.addSubview(toView)
        } else {
            container.addSubview(toView)
            container.addSubview(fromView)
        }
        
        let duration = self.transitionDuration(transitionContext)
    
        //From Transition
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: nil, animations: {
            if (self.presenting) {
                fromView.transform = self.home_translation()
            } else {
                fromView.transform = offScreenRight
            }
            }, completion: nil
        )
        
        //To Transition
        UIView.animateWithDuration(duration, delay: 2.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: nil, animations: {
            if (self.presenting) {
                toView.transform = CGAffineTransformMakeTranslation(self.sidebarwidth, 0)
            } else {
                toView.transform = CGAffineTransformIdentity
            }
            }, completion: { finished in
                transitionContext.completeTransition(true)
            }
        )
        
    }
    
    func home_translation() -> CGAffineTransform {
        let π : CGFloat = 3.14159265359
        let rotation = CGAffineTransformMakeRotation(-π/2)
        let position = CGAffineTransformMakeTranslation(-5, -150)
        return CGAffineTransformConcat(rotation, position)
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 3
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
}