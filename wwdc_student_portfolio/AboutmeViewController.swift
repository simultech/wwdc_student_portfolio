//
//  AboutmeController.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 20/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class AboutmeViewController : BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadModel()
    }
    
    override func viewDidAppear(animated: Bool) {
        makeBackground("My name is",highlightText:"Andrew Dekker",yoffset:41,highlightColor:UIColor(hue: 0.486, saturation: 0.556, brightness: 0.910, alpha: 1))
    }
    
    //Mark: Data loading
    func loadModel() {
        model = Aboutme.new()
        model.load(modelLoaded)
    }
    
    func modelLoaded() {
        print("AND WE ARE DONE")
        print(model.items)
    }
}
