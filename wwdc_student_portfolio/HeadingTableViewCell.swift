//
//  HeadingTableViewCell.swift
//  Andrew Dekker
//
//  Created by Andrew Dekker on 24/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class HeadingTableViewCell: BaseTableViewCell {
    
    override func heightForView() -> CGFloat{
        return 50
    }

    override func setCellData(data: NSDictionary) {
        super.setCellData(data)
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, BaseTableViewCell.width, view.frame.size.height))
        label.text = cellText
        label.font = UIFont(name: "Helvetica", size: 24)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        view.backgroundColor = UIColor.clearColor()
        view.layer.cornerRadius = 0
        view.layer.borderWidth = 0
        view.frame.origin.x = 0
        view.frame.origin.y = 20
        view.addSubview(label)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
