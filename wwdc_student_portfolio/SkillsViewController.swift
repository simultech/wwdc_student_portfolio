//
//  SkillsController.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 20/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class SkillsViewController : BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadModel()
    }
    
    override func viewDidAppear(animated: Bool) {
        makeBackground("I am an",highlightText:"Interaction Designer",yoffset:41,highlightColor:UIColor(hue: 0.032, saturation: 0.588, brightness: 1.000, alpha: 1))
        super.viewDidAppear(animated)
    }
    
    //Mark: Data loading
    func loadModel() {
        self.model = Skills.new()
        self.model.load(reloadTableView)
    }
    
}
