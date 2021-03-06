//
//  ViewController.swift
//  SwiftKickiOSDemo
//
//  Created by Jason Dudash on 10/29/15.
//
//    The MIT License (MIT)
//
//    Copyright (c) 2015 Jason Dudash
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

import UIKit
import SwiftKick

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        log.colored_ = false

        let first = UserDefaults.isFirstLaunch()
        log.always("First launch = \(first)")
        
        log.always("Verbose message...\n")
        log.trace("Trace message...\n")
        log.debug("Debug message...\n")
        log.info("Info message...\n")
        log.warn("Warning message...\n")
        log.error("Error message...\n")
        log.fatal("Fatal message...\n")

        log.emptyLine()

        log.colored_ = true

        log.always("Verbose message...\n")
        log.trace("Trace message...\n")
        log.debug("Debug message...\n")
        log.info("Info message...\n")
        log.warn("Warning message...\n")
        log.error("Error message...\n")
        log.fatal("Fatal message...\n")

        log.emptyLine()

        log.always("Verbose message...\n")
        log.trace("Trace message...\n")
        log.debug("Debug message...\n")
        log.info("Info message...\n")
        log.warn("Warning message...\n")
        log.error("Error message...\n")
        log.fatal("Fatal message...\n")

        log.emptyLine()

        log.changeLogLevel(.always)

        log.always("Verbose message...\n")
        log.trace("Trace message...\n")
        log.debug("Debug message...\n")
        log.info("Info message...\n")
        log.warn("Warning message...\n")
        log.error("Error message...\n")
        log.fatal("Fatal message...\n")

        log.emptyLine()

        log.changeLogLevel(.warn)

        log.always("Verbose message...\n")
        log.trace("Trace message...\n")
        log.debug("Debug message...\n")
        log.info("Info message...\n")
        log.warn("Warning message...\n")
        log.error("Error message...\n")
        log.fatal("Fatal message...\n")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

