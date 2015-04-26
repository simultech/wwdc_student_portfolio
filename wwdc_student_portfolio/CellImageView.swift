//
//  CellImageView.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 24/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class CellImageView: UIView, UIGestureRecognizerDelegate {
    
    static var imageCache:NSMutableDictionary = [:]
    static var imageToShow:NSString = ""

    var imageView:UIImageView!
    var isFullScreen:Bool = false
    var tap:UIGestureRecognizer?
    var previousFrame:CGRect?
    var enableZoom:Bool = true
    var urlKey:NSString!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func showImage(urlString: String) {
        let charactersToRemove = NSCharacterSet.alphanumericCharacterSet().invertedSet
        let urlComponents:NSArray = urlString.componentsSeparatedByCharactersInSet(charactersToRemove)
        self.urlKey = urlComponents.componentsJoinedByString("")
        print(CellImageView.imageCache)
        self.clipsToBounds = true;
        self.previousFrame = self.frame
        self.imageView = UIImageView(frame: self.frame)
        self.imageView.frame.origin.x = 0
        self.imageView.frame.origin.y = 0
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        if(CellImageView.imageCache.objectForKey(urlKey) != nil) {
                dispatch_async(dispatch_get_main_queue(), {
                    self.imageView.image = CellImageView.imageCache.objectForKey(self.urlKey) as? UIImage
                    if(self.enableZoom) {
                        var tapGesture = UITapGestureRecognizer(target: self, action: "imageTapped")
                        self.addGestureRecognizer(tapGesture)
                    }
                })
            } else {
                let spinner:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
                self.addSubview(spinner)
                spinner.frame.origin.x = self.frame.size.width/2 - 24
                spinner.frame.origin.y = self.frame.size.height/2 - 24
                spinner.startAnimating()
                let url = NSURL(string: urlString)
                let request: NSURLRequest = NSURLRequest(URL: url!)
                let mainQueue = NSOperationQueue.mainQueue()
                NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
                    if error == nil {
                        let image = UIImage(data: data)
                        CellImageView.imageCache.setValue(image, forKey: self.urlKey as String)
                        dispatch_async(dispatch_get_main_queue(), {
                            spinner.stopAnimating()
                            spinner.removeFromSuperview()
                            self.imageView.image = UIImage(data: data!)
                            if(self.enableZoom) {
                                var tapGesture = UITapGestureRecognizer(target: self, action: "imageTapped")
                                self.addGestureRecognizer(tapGesture)
                            }
                        })
                    }
                    else {
                        println("Error: \(error.localizedDescription)")
                    }
            })
        }
        self.imageView.userInteractionEnabled = true;
        self.addSubview(self.imageView)
        print("BBB")
    }
    
    func imageTapped() {
        CellImageView.imageToShow = self.urlKey
        NSNotificationCenter.defaultCenter().postNotificationName("showFullImage", object: nil)
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
