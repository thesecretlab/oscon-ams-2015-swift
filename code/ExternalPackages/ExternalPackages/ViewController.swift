//
//  ViewController.swift
//  ExternalPackages
//
//  Created by Jon Manning on 28/10/2015.
//  Copyright © 2015 Secret Lab. All rights reserved.
//

import UIKit
import Alamofire
import SQLite
import SwiftyJSON
import SafariServices

class ViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        
        NSUserDefaults.standardUserDefaults().stringForKey("username")
        
        let safari = SFSafariViewController(URL: NSURL(string:"https://google.com")!)
        
        self.presentViewController(safari, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let request = Alamofire.request(.GET, "https://httpbin.org")
        
        print(request.debugDescription)
        
        
        
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo":"bar"], encoding:  .JSON )
            .responseJSON { (response) -> Void in
                
                /*if let JSON = response.result.value as? [String:AnyObject] {
                    print(JSON)
                }*/
                let json = JSON(data: response.data!)
                print("Origin: \(json["headers"]["Host"].stringValue)")
                
        }
        
        do {
            let db = try Connection()
            
            let users = Table("Users")
            
            let id = Expression<Int64>("id")
            let name = Expression<String>("name")
            let email = Expression<String?>("email")
            
            try db.run(users.create(block: { (tableBuilder) -> Void in
                tableBuilder.column(id, primaryKey:true)
                tableBuilder.column(name)
                tableBuilder.column(email, unique:true)
            }))
            
            let insert = users.insert(name <- "Alice", email <- "alice@example.com")
            let rowID = try db.run(insert)
            
            print("Alice's row ID is \(rowID)")
            
            for user in db.prepare(users) {
                print("User: \(user)")
            }
            
        } catch let error {
            print("Error: \(error)")
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

