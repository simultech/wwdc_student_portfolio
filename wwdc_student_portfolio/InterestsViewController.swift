//
//  InterestsController.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 20/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class InterestsViewController : BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadModel()
    }
    
    override func viewDidAppear(animated: Bool) {
        makeBackground("and I love to",highlightText:"create and hack",yoffset:41,highlightColor:UIColor(hue: 0.885, saturation: 0.518, brightness: 1.000, alpha: 1))
        super.viewDidAppear(animated)
    }
    
    //Mark: Data loading
    func loadModel() {
        self.model = Interests.new()
        self.model.load(reloadTableView)
    }
    
}
