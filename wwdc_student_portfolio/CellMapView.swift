//
//  MapView.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 23/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit
import MapKit

class CellMapView: UIView, MKMapViewDelegate {
    
    var mapView:MKMapView!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func showMap(text:String,latitude:Double,longitude:Double,span:Double) {
        self.mapView = MKMapView(frame: self.frame)
        self.mapView.frame.origin.x = 0
        self.mapView.frame.origin.y = 0
        self.mapView.delegate = self
        
        //Setup map
        let location = CLLocationCoordinate2D(latitude: latitude,longitude: longitude)
        let span = MKCoordinateSpanMake(span, span)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //Add annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = text
        mapView.addAnnotation(annotation)
        
        self.addSubview(self.mapView)
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        let reuseIdentifier = "mapAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseIdentifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView.image = UIImage(named:"map_icon")
            annotationView.centerOffset = CGPointMake(0, -18)
        } else {
            annotationView.annotation = annotation
        }
        return annotationView
    }

}
