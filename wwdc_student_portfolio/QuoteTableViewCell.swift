//
//  QuoteTableViewCell.swift
//  Andrew Dekker
//
//  Created by Andrew Dekker on 24/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class QuoteTableViewCell: BaseTableViewCell {
    
    override func setCellData(data: NSDictionary) {
        super.setCellData(data)
        let label:UILabel = UILabel(frame: CGRectMake(10, 10, BaseTableViewCell.width-40, CGFloat.max))
        label.text = "\""+cellText+"\""
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = UIFont (name: "HelveticaNeue-Italic", size: 18)
        label.sizeToFit()
        label.frame.origin.y = 10
        label.textColor = UIColor.darkGrayColor()
        view.addSubview(label)
        view.backgroundColor = UIColor.clearColor()
    }
}