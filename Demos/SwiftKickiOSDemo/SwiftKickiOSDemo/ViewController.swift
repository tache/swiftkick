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
        log.coloredLogFlag = false
        
        log.verbose("Verbose message...\n")
        log.trace("Trace message...\n")
        log.debug("Debug message...\n")
        log.info("Info message...\n")
        log.warn("Warning message...\n")
        log.error("Error message...\n")
        log.fatal("Fatal message...\n")
        
        log.emptyLine()
        
        log.coloredLogFlag = true
        
        log.verbose("Verbose message...\n")
        log.trace("Trace message...\n")
        log.debug("Debug message...\n")
        log.info("Info message...\n")
        log.warn("Warning message...\n")
        log.error("Error message...\n")
        log.fatal("Fatal message...\n")
        
        log.emptyLine()
        
        log.verboseColor = UIColor(red:0.91, green:0.3, blue:0.24, alpha:1)
        log.traceColor = UIColor(red:0.69, green:0.96, blue:0.4, alpha:1)
        log.debugColor = UIColor(red:0.62, green:0.88, blue:0.68, alpha:1)
        log.infoColor = UIColor(red:0.29, green:0.71, blue:0.76, alpha:1)
        log.warnColor = UIColor(red:0.97, green:0.54, blue:0.88, alpha:1)
        log.errorColor = UIColor(red:0.65, green:0.64, blue:0.49, alpha:1)
        log.fatalColor = UIColor(red:0.44, green:0.58, blue:0.8, alpha:1)
        
        log.verbose("Verbose message...\n")
        log.trace("Trace message...\n")
        log.debug("Debug message...\n")
        log.info("Info message...\n")
        log.warn("Warning message...\n")
        log.error("Error message...\n")
        log.fatal("Fatal message...\n")
        
        log.emptyLine()
        
        log.setLogLevel(LoggerLevel.VERBOSE)
        
        log.verboseColor = UIColor(red:0.5, green:0.5, blue:0.5, alpha:1)
        log.traceColor = UIColor(red:0.6, green:0.6, blue:0.6, alpha:1)
        log.debugColor = UIColor(red:0.7, green:0.7, blue:0.7, alpha:1)
        log.infoColor = UIColor(red:0.8, green:0.8, blue:0.8, alpha:1)
        log.warnColor = UIColor(red:0.9, green:0.9, blue:0.9, alpha:1)
        log.errorColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1)
        log.fatalColor = UIColor(red:1.0, green:0.2, blue:0.2, alpha:1)
        
        log.verbose("Verbose message...\n")
        log.trace("Trace message...\n")
        log.debug("Debug message...\n")
        log.info("Info message...\n")
        log.warn("Warning message...\n")
        log.error("Error message...\n")
        log.fatal("Fatal message...\n")
        
        log.emptyLine()
        
        log.setLogLevel(LoggerLevel.WARN)
        
        log.verboseColor = UIColor(red:0.5, green:0.5, blue:0.5, alpha:1)
        log.traceColor = UIColor(red:0.6, green:0.6, blue:0.6, alpha:1)
        log.debugColor = UIColor(red:0.7, green:0.7, blue:0.7, alpha:1)
        log.infoColor = UIColor(red:0.8, green:0.8, blue:0.8, alpha:1)
        log.warnColor = UIColor(red:0.9, green:0.9, blue:0.9, alpha:1)
        log.errorColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1)
        log.fatalColor = UIColor(red:1.0, green:0.2, blue:0.2, alpha:1)
        
        log.verbose("Verbose message...\n")
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

