//
//  ExternalPackagesTests.swift
//  ExternalPackagesTests
//
//  Created by Jon Manning on 28/10/2015.
//  Copyright © 2015 Secret Lab. All rights reserved.
//

import XCTest
import Alamofire

class ExternalPackagesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let downloadedExpectation = self.expectationWithDescription("File was downloaded")
        
        Alamofire.request(.GET, "https://httpbin.org/get").responseJSON { (response) -> Void in
            
            downloadedExpectation.fulfill()
            
        }
        
        self.waitForExpectationsWithTimeout(2.0, nil)
        
    }
    
}
