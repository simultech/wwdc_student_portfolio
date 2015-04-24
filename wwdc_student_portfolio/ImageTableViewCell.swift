//
//  ImageTableViewCell.swift
//  Andrew Dekker
//
//  Created by Andrew Dekker on 24/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class ImageTableViewCell: BaseTableViewCell {
    
    var imageCellView:CellImageView?

    override func heightForView() -> CGFloat{
        return 200.0
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func setCellData(data:NSDictionary){
        super.setCellData(data)
        self.addImage()
    }
    
    func addImage() {
        print("ADDING IMAGE")
        if(imageCellView != nil) {
            imageCellView!.superview?.removeFromSuperview()
        }
        imageCellView = CellImageView(frame: CGRectMake(0, 0, BaseTableViewCell.width, 200))
        imageCellView!.backgroundColor = UIColor.whiteColor()
        imageCellView!.showImage(self.data?.objectForKey("content") as! String)
        self.view.addSubview(imageCellView!)
    }

}
