//
//  AboutmeController.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 20/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class AboutmeViewController : UIViewController {
    func setup(){
        print("about me page")
    }
    
    override func viewDidAppear(animated: Bool) {
        print("APPEARED")
        //move the origin back, fake create the
        print(self.view.frame.origin)
    }
    
    override func viewDidLoad() {
        print("LOADED")
    }


}
