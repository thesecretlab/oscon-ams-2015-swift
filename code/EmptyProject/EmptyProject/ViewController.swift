//
//  ViewController.swift
//  EmptyProject
//
//  Created by Jon Manning on 28/10/2015.
//  Copyright © 2015 Secret Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let data = DataSource()
        _ = data.stringThing()
        
    }
    @IBAction func clicked(sender: AnyObject) {
        //myButton.setTitle("Hello", forState: UIControlState.Normal)
        
        self.performSegueWithIdentifier("PushSegue", sender: sender)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    

}

