//
//  AboutmeController.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 20/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class AboutmeViewController : BaseViewController {

    @IBAction func aboutMeButtonClick(sender: UIButton) {
        print("about me button click")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        makeBackground("My name is",highlightText:"Andrew Dekker",yoffset:41,highlightColor:UIColor(hue: 0.486, saturation: 0.556, brightness: 0.910, alpha: 1))
    }
}
