//
//  TextTableViewCell.swift
//  Andrew Dekker
//
//  Created by Andrew Dekker on 24/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class TextTableViewCell: BaseTableViewCell {

    override func setCellData(data: NSDictionary) {
        super.setCellData(data)
        let label:UILabel = UILabel(frame: CGRectMake(10, 10, BaseTableViewCell.width-40, CGFloat.max))
        label.text = cellText
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.sizeToFit()
        label.frame.origin.y = 10
        view.addSubview(label)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
