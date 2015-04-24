//
//  Base.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 23/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class Base: NSObject {
    
    var items:NSArray = []
    var endpoint:String = ""
    let baseURL:String = "http://simultech.net/api/"
    
    //Mark: Data loader
    func load(completion: (() -> Void)!) {
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: baseURL+endpoint)
        var task = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            if(error != nil) {
                print(error.localizedDescription)
            } else {
                var error : NSError?
                
                var responseData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSArray
                if(error != nil) {
                    print(error?.localizedDescription)
                } else {
                    self.items = responseData
                    dispatch_async(dispatch_get_main_queue(), {
                        completion()
                    })
                }
            }
        })
        task.resume()
    }
   
}