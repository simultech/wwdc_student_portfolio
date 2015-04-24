//
//  ProjectsController.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 20/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class ProjectsViewController : BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadModel()
    }
    
    override func viewDidAppear(animated: Bool) {
        makeBackground("working on a",highlightText:"number of projects",yoffset:41,highlightColor:UIColor(hue: 0.733, saturation: 0.678, brightness: 0.961, alpha: 1))
        super.viewDidAppear(animated)
    }
    
    //Mark: Data loading
    func loadModel() {
        self.model = Projects.new()
        self.model.load(reloadTableView)
    }
    
}
