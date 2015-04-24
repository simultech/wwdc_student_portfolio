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
        super.viewDidAppear(animated)
        
        var mapView = CellMapView(frame: CGRectMake(50, 50, 200, 200))
        mapView.showMap("Something", latitude: -27.4, longitude: 153, span: 0.05)
        self.view.addSubview(mapView)
        
        var imageView = CellImageView(frame: CGRectMake(50, 250, 200, 200))
        imageView.backgroundColor = UIColor.yellowColor()
        imageView.showImage("http://upload.wikimedia.org/wikipedia/commons/5/58/Sunset_2007-1.jpg")
        self.view.addSubview(imageView)
    }
    
    //Mark: Data loading
    func loadModel() {
        self.model = Aboutme.new()
        self.model.load(reloadTableView)
    }
}
