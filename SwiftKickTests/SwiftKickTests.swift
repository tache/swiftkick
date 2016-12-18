//
//  SwiftKickTests.swift
//  SwiftKickTests
//
//  Created by Jason Dudash on 1/9/15.
//  Copyright (c) 2015 Jason Dudash. All rights reserved.
//

import XCTest
import SwiftKick

class SwiftKickTests: XCTestCase {
    var log:Logger!
    
    override func setUp() {
        super.setUp()
        log = SwiftKick.Logger(.trace, verbosity:.default)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        log.trace("TESTING TRACE")
        log.debug("TESTING DEBUG")
        log.info("TESTING INFO")
        log.warn("TESTING WARN")
        log.error("TESTING ERROR")
        log.fatal("TESTING FATAL")
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }

    func testEntryAndExitExample() {
        log.entered()
        // This is an example of using helper enter and exit methods.
        log.returning()
    }

}
