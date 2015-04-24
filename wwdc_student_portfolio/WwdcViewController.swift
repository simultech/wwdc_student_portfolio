//
//  WwdcController.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 20/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class WwdcViewController : BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadModel()
    }
    
    override func viewDidAppear(animated: Bool) {
        makeBackground("",highlightText:"WWDC15",yoffset:41,highlightColor:UIColor(hue: 0.570, saturation: 0.653, brightness: 0.973, alpha: 1))
        super.viewDidAppear(animated)
    }
    
    //Mark: Data loading
    func loadModel() {
        self.model = Wwdc.new()
        self.model.load(reloadTableView)
    }
    
}
