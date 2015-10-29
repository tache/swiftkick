//
//  ViewController.swift
//  SwiftKickiOSDemo
//
//  Created by Christopher Graham on 10/29/15.
//  Copyright (c) 2015 Mondo Cool Studios. All rights reserved.
//

import UIKit
import SwiftKick

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        log.colored_ = false
        
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
        
        log.changeLogLevel(LoggerLevel.ALWAYS)
        
        log.always("Verbose message...\n")
        log.trace("Trace message...\n")
        log.debug("Debug message...\n")
        log.info("Info message...\n")
        log.warn("Warning message...\n")
        log.error("Error message...\n")
        log.fatal("Fatal message...\n")
        
        log.emptyLine()
        
        log.changeLogLevel(LoggerLevel.WARN)

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

