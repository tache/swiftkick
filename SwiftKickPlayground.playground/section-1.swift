// Playground - noun: a place where people can play

import SwiftKick

//-----------------------------------------------------------------------------------------------
// Logger
//-----------------------------------------------------------------------------------------------
// Set a log level to restrict output, and a verbosity of the output
let log = SwiftKick.Logger(level: Logger.LoggerLevel.WARN, verbosity:Logger.LoggerVerbosity.DEFAULT)

// print a lone at each logging level (some will get hidden based on logger initialization)
log.trace("TESTING TRACE")
log.debug("TESTING DEBUG")
log.info("TESTING INFO")
log.warn("TESTING WARN")
log.error("TESTING ERROR")
log.fatal("TESTING FATAL")


//-----------------------------------------------------------------------------------------------
// String
//-----------------------------------------------------------------------------------------------
// build a URL string
let myString:String = "http:\\\\Make/this into a @URL string"
let myStringURL = myString.encodeForURL()

// base64 encode a string
let someString = "This is a string I'd like like to encode"
let b64String:String = someString.toBase64()! as String
b64String.fromBase64()

 
