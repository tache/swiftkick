
import SwiftKick

//-----------------------------------------------------------------------------------------------
// Logger
//-----------------------------------------------------------------------------------------------
// Set a log level to restrict output, and a verbosity of the output
let log = SwiftKick.Logger(.warn, verbosity:.default)

// print a lone at each logging level (some will get hidden based on logger initialization)
log.trace("TESTING TRACE")
log.debug("TESTING DEBUG")
log.info("TESTING INFO")
log.warn("TESTING WARN")
log.error("TESTING ERROR")
log.fatal("TESTING FATAL")

