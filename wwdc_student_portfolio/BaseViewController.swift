//
//  BaseViewController.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 22/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sidebar:UIView!
    var backButton:UIButton!
    var model:Base!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarBG = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 22))
        statusBarBG.backgroundColor = UIColor.blackColor()
        self.view.addSubview(statusBarBG)
        //setup tableview
        if(tableView != nil) {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.alpha = 0
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        fadeIn(tableView as UIView, delay: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fadeIn(view:UIView, delay:NSNumber) {
        UIView.animateWithDuration(NSTimeInterval(0.5), delay: delay.doubleValue, options: nil, animations: {
            view.alpha = 1.0
            }, completion:nil);
    }
    
    func backButtonClicked() {
        UIView.animateWithDuration(NSTimeInterval(0.5), delay: 0, options: nil, animations: {
            if(self.tableView != nil) {
                self.tableView.alpha = 0
            }
            self.backButton.alpha = 0
            }, completion:{ finished in
                self.sidebar.removeFromSuperview()
                self.view.frame.origin.x = 50
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        );
    }
    
    func makeBackground(text:String,highlightText:String,yoffset:CGFloat,highlightColor:UIColor) {
        
        self.view.frame.origin.x = 0
        sidebar = UIView(frame: CGRectMake(0, 0, 50, self.view.frame.size.height))
        sidebar.backgroundColor = UIColor.blackColor()
        self.view.addSubview(sidebar)
        
        backButton = UIButton(frame: CGRectMake(0, 20, 50, 50))
        let backButtonImage = UIImageView(image: UIImage(named: "back_button"))
        backButtonImage.frame.origin.x = 18
        backButtonImage.frame.origin.y = 14
        backButton.addSubview(backButtonImage)
        backButton.addTarget(self, action: Selector("backButtonClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        sidebar.addSubview(backButton)
        backButton.alpha = 0
        fadeIn(backButton, delay:0)
        
        let sideBarText = UILabel(frame: CGRectMake(-65, 0, 180, 50))
        sideBarText.textColor = UIColor.whiteColor()
        sideBarText.textAlignment = NSTextAlignment.Right
        sideBarText.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        sideBarText.text = text
        sideBarText.font = UIFont.systemFontOfSize(20)
        sidebar.addSubview(sideBarText)
        let sideBarHighlight = UILabel(frame: CGRectMake(-65, 0, 180, 50))
        sideBarHighlight.text = highlightText
        sideBarHighlight.textColor = highlightColor
        sideBarHighlight.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
        sideBarHighlight.font = UIFont.systemFontOfSize(20)
        sidebar.addSubview(sideBarHighlight)
        
        //Fix y position
        let sideBarTextWidth = NSString(string: text).sizeWithAttributes([NSFontAttributeName: sideBarText.font]).width
        let sideBarHightlightWidth = NSString(string: highlightText).sizeWithAttributes([NSFontAttributeName: sideBarHighlight.font]).width
        var difference = abs(sideBarTextWidth-sideBarHightlightWidth)/2
        if(text == "") {
            difference = sideBarHightlightWidth/2
        }
        
        sideBarText.frame.origin.y = self.view.frame.size.height/2 + difference + 5
        sideBarHighlight.frame.origin.y = self.view.frame.size.height/2 - 185 + difference + 5
    }
    
    func reloadTableView() {
        print("$$$")
        print(self.model.items)
        print("$$$")
        self.tableView.reloadData()
        print("IVE JUST RELOADED")
    }
    
    //TableView methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.model != nil) {
            println("====")
            println("ROWS")
            println(self.model.items.count)
            println("====")
            return self.model.items.count
        }
        print("NO ROWS")
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("CELL REFRESH")
        let baseCell = "BaseCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(baseCell, forIndexPath: indexPath) as! UITableViewCell
        var cellData:NSDictionary = self.model.items.objectAtIndex(indexPath.row) as! NSDictionary
        cell.textLabel!.text = cellData.objectForKey("content") as? String
        return cell
    }

}
