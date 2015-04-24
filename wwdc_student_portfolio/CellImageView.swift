//
//  CellImageView.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 24/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class CellImageView: UIView, UIGestureRecognizerDelegate {

    var imageView:UIImageView!
    var isFullScreen:Bool = false;
    var tap:UIGestureRecognizer?
    var previousFrame:CGRect?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func showImage(urlString: String) {
        self.clipsToBounds = true;
        self.previousFrame = self.frame
        self.imageView = UIImageView(frame: self.frame)
        self.imageView.frame.origin.x = 0
        self.imageView.frame.origin.y = 0
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        let url = NSURL(string: urlString)
        //let data = NSData(contentsOfURL: url!)
        let request: NSURLRequest = NSURLRequest(URL: url!)
        let mainQueue = NSOperationQueue.mainQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
            if error == nil {
                let image = UIImage(data: data)
                dispatch_async(dispatch_get_main_queue(), {
                    self.imageView.image = UIImage(data: data!)
                    var tapGesture = UITapGestureRecognizer(target: self, action: "imageTapped")
                    self.addGestureRecognizer(tapGesture)
                })
            }
            else {
                println("Error: \(error.localizedDescription)")
            }
        })
        self.imageView.userInteractionEnabled = true;
        self.addSubview(self.imageView)
    }
    
    func imageTapped() {
        if (!isFullScreen) {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.previousFrame = self.frame
                self.frame.size = UIScreen.mainScreen().bounds.size
                self.frame.origin.x = 0
                self.frame.origin.y = 0
                self.imageView.frame.size = self.frame.size
            })
            self.isFullScreen = true
        } else {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.frame = self.previousFrame!
                self.imageView.frame = self.frame
                self.imageView.frame.origin.x = 0
                self.imageView.frame.origin.y = 0
            })
            self.isFullScreen = false
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        return true
    }
    
    /*
-(void)imgToFullScreen{
if (!isFullScreen) {
[UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
//save previous frame
prevFrame = yourImageView.frame;
[yourImageView setFrame:[[UIScreen mainScreen] bounds]];
}completion:^(BOOL finished){
isFullScreen = true;
}];
return;
} else {
[UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
[yourImageView setFrame:prevFrame];
}completion:^(BOOL finished){
isFullScreen = false;
}];
return;
}
}
*/
}
