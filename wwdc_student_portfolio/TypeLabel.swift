//
//  TypeLabel.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 21/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class TypeLabel : UILabel {
    
    var defaultText:NSString = ""
    var currentPosition:Int = 0
    var timer:NSTimer = NSTimer.new()
    
    func typeInView(text:NSString, delay:NSNumber) {
        self.defaultText = text
        self.text = ""
        self.alpha = 1
        currentPosition = 0
        NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(delay), target: self, selector: Selector("startText"), userInfo: nil, repeats: false)
    }
    
    func startText() {
        timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(0.1), target: self, selector: Selector("addText"), userInfo: nil, repeats: true)
    }
    
    func addText() {
        if(defaultText.length > currentPosition) {
            let range:NSRange = NSRange(location: currentPosition, length: 1)
            let to_add = defaultText.substringWithRange(range)
            self.text = self.text!+to_add
            currentPosition += 1
        } else {
            timer.invalidate()
        }
    }
}