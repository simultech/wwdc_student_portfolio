//
//  ViewController.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 20/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var skip:Bool = true
    
    @IBOutlet weak var helloButton: UIButton!
    
    @IBOutlet weak var aboutmeButton: UIButton!
    @IBOutlet weak var interestsButton: UIButton!
    @IBOutlet weak var projectsButton: UIButton!
    @IBOutlet weak var wwdcButton: UIButton!
    @IBOutlet weak var skillsButton: UIButton!

    @IBOutlet weak var aboutmeText: TypeLabel!
    @IBOutlet weak var skillsText: TypeLabel!
    @IBOutlet weak var interestsText: TypeLabel!
    @IBOutlet weak var projectsText: TypeLabel!
    @IBOutlet weak var wwdcText: TypeLabel!
    
    @IBOutlet weak var wisp: WispView!
    
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideText()
        let pan = UIPanGestureRecognizer(target: self, action: "panGesture:")
        self.view.addGestureRecognizer(pan)
        
        var selfview = UIImageView(image: UIImage(named: "face"))
        self.view.addSubview(selfview)
        self.view.sendSubviewToBack(selfview)
        selfview.maskView = self.wisp.maskImageView
    }
    
    func panGesture(recognizer:UIPanGestureRecognizer) {
        var translatedPoint = recognizer.locationInView(self.view)
        self.wisp.center = CGPointMake(translatedPoint.x, translatedPoint.y)
        if(recognizer.state == UIGestureRecognizerState.Ended || recognizer.state == UIGestureRecognizerState.Cancelled) {
            fadeOut(self.wisp, delay:0)
            fadeOut(self.wisp.maskImageView, delay: 0)
        }
        self.wisp.maskImageView.center = self.wisp.center
    }
    
    func hideText() {
        if(!skip) {
            helloButton.alpha = 0
            aboutmeButton.alpha = 0
            interestsButton.alpha = 0
            skillsButton.alpha = 0
            projectsButton.alpha = 0
            wwdcButton.alpha = 0
            aboutmeText.alpha = 0
            projectsText.alpha = 0
            skillsText.alpha = 0
            interestsText.alpha = 0
            wwdcText.alpha = 0
        }
        self.wisp.alpha = 0
        self.wisp.maskImageView.alpha = 0
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        fadeIn(self.wisp, delay: 0)
        fadeIn(self.wisp.maskImageView, delay: 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        fadeIn(self.helloButton, delay:2);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Transitions
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toViewController = segue.destinationViewController as! UIViewController
        if(sender != nil) {
            if(sender!.isEqual(self.aboutmeButton)) {
                self.transitionManager.xAnimatePostion = -255
            } else if(sender!.isEqual(self.interestsButton)) {
                self.transitionManager.xAnimatePostion = -300
            } else if(sender!.isEqual(self.skillsButton)) {
                self.transitionManager.xAnimatePostion = -350
            } else if(sender!.isEqual(self.projectsButton)) {
                self.transitionManager.xAnimatePostion = -400
            } else if(sender!.isEqual(self.wwdcButton)) {
                self.transitionManager.xAnimatePostion = -450
            } else {
                self.transitionManager.xAnimatePostion = 0
            }
        }
        toViewController.transitioningDelegate = self.transitionManager
    }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        
    }
    
    // MARK: Event listeners
    
    @IBAction func helloClicked(sender: AnyObject) {
        typeIn(self.aboutmeText, delay: 0)
        fadeIn(self.aboutmeButton, delay: 1)
        typeIn(self.skillsText, delay: 2)
        fadeIn(self.skillsButton, delay: 2.8)
        typeIn(self.interestsText, delay: 4)
        fadeIn(self.interestsButton, delay: 5.4)
        typeIn(self.projectsText, delay: 6.4)
        fadeIn(self.projectsButton, delay: 7.4)
        typeIn(self.wwdcText, delay: 9.2)
        fadeIn(self.wwdcButton, delay: 12.0)
    }
    
//    @IBAction func aboutClicked(sender: AnyObject) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc:UIViewController = storyboard.instantiateViewControllerWithIdentifier("AboutVC") as! UIViewController
//        vc.transitioningDelegate = self
//        vc.modalPresentationStyle = UIModalPresentationStyle.None
////        let storyboard = UIStoryboard(name: "Main", bundle: nil)
////        let vc:UIViewController = storyboard.instantiateViewControllerWithIdentifier("AboutVC") as! UIViewController
////        self.presentViewController(vc, animated: true, completion: {
////            print("PRESENTED")
////        })
//    }
    
    @IBAction func interestsClicked(sender: AnyObject) {
    }
    
    @IBAction func skillsClicked(sender: AnyObject) {
    }
    
    @IBAction func projectsClicked(sender: AnyObject) {
    }
    
    @IBAction func wwdcClicked(sender: AnyObject) {
    }
    
    
    // MARK: Helper methods
    func typeIn(view:TypeLabel, delay:NSNumber) {
        view.typeInView(view.text!, delay:delay)
    }
    
    func fadeIn(view:UIView, delay:NSNumber) {
        
        UIView.animateWithDuration(NSTimeInterval(1.5), delay: delay.doubleValue, options: nil, animations: {
            view.alpha = 1.0
        }, completion:nil);
    }
    
    func fadeOut(view:UIView, delay:NSNumber) {
        UIView.animateWithDuration(1.5, delay: delay.doubleValue, options: nil, animations: {
            view.alpha = 0.0
            }, completion:nil);
    }
    
    // MARK: TransitioningDelegate methods
    
//    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        let animator:TLTransitionAnimator = TLTransitionAnimator.new()
//    }
}

