//
//  ViewController.swift
//  wwdc_student_portfolio
//
//  Created by Andrew Dekker on 20/04/2015.
//  Copyright (c) 2015 Andrew Dekker. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Menu Event Listeners
    
    @IBAction func wwdcClicked(sender: AnyObject) {
        print("TEST")
    }
    
    @IBAction func projectsClicked(sender: AnyObject) {
    }
    
    @IBAction func interestsClicked(sender: AnyObject) {
    }

    @IBAction func skillsClicked(sender: AnyObject) {
    }
    
    @IBAction func aboutmeClicked(sender: AnyObject) {
    }
    
}

