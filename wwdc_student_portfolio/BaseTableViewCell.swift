//
//  BaseTableViewCell.swift
//  Andrew Dekker
//
//  Created by Andrew Dekker on 24/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    var data:NSDictionary?
    var cellText:String!
    let cellWidth:CGFloat = 270
    var view:UIView!
    static var width:CGFloat!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("set selected")
        // Configure the view for the selected state
    }
    
    
    func setCellData(data:NSDictionary){
        self.data = data
        self.addSubview(wrapContent())
    }
    
    func wrapContent()->UIView{
        self.backgroundColor = UIColor.clearColor()
        cellText = data?.objectForKey("content") as? String
        let height:CGFloat = heightForView()
        if(view != nil) {
            if(view.superview != nil) {
                view.removeFromSuperview()
            }
        }
        view = UIView(frame:CGRect(x: 10, y: 10, width: BaseTableViewCell.width-20, height: height-20))
        view.layer.cornerRadius = 9
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 1.0, alpha: 0.8)
        return view
    }
    
    func heightForView() -> CGFloat{
        let cellFont = UIFont(name: "Helvetica", size: 20.0)
        let label:UILabel = UILabel(frame: CGRectMake(0, 10, cellWidth, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = cellFont
        label.text = cellText
        
        label.sizeToFit()
        return label.frame.height+10
    }
}