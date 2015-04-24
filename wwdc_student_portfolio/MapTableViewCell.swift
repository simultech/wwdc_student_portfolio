//
//  MapTableViewCell.swift
//  Andrew Dekker
//
//  Created by Andrew Dekker on 24/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class MapTableViewCell: BaseTableViewCell {
    
    var mapView:CellMapView?
    
    override func heightForView() -> CGFloat{
        return 200.0
    }
    
    override func setCellData(data:NSDictionary){
        super.setCellData(data)
        self.addMap()
    }
    
    func addMap() {
        if(mapView != nil) {
            mapView?.superview?.removeFromSuperview()
        }
        mapView = CellMapView(frame: CGRectMake(0, 0, BaseTableViewCell.width, 200))
        let mapString: String = self.data?.objectForKey("content") as! String
        let latitudeString: String = self.data?.objectForKey("latitude") as! String
        let longitudeString: String = self.data?.objectForKey("longitude") as! String
        let latitude: Double = (latitudeString as NSString).doubleValue
        let longitude: Double = (longitudeString as NSString).doubleValue
        mapView!.showMap(mapString, latitude: latitude, longitude: longitude, span: 20)
        mapView!.layer.cornerRadius = 4
        self.view.addSubview(mapView!)
    }

}
