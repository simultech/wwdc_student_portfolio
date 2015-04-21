//
//  AboutmeController.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 20/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class AboutmeViewController : UIViewController {
    @IBOutlet weak var aboutMeButton: UIButton!
    @IBOutlet weak var aboutMeLabel: UILabel!

    @IBAction func aboutMeButtonClick(sender: UIButton) {
        print("about me button click")
    }

    override func viewDidLoad() {
    print("about me page")
        //aboutMeButton.titleLabel?.text = "hello"
        aboutMeButton.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
       
    }
    func setup(){

    }


}
