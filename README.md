# SwiftKick
Useful classes for use with the Swift programming language.  This project just started, so the logger is the only class right now.

## Simple to Use with CocoaPods
Add the cocoapod for swiftkick with:
 > pod "SwiftKick", :git => 'https://github.com/dudash/swiftkick.git'

Import the library into your xcode project:
 > import SwiftKick

## Classes
### Logger
Create a logger object with desired output level and verbosity:
 > let log = SwiftKick.Logger(level: Logger.LoggerLevel.TRACE, verbosity:Logger.LoggerVerbosity.DEFAULT)

Add log everywhere in your code:
 > log.debug("Properties are = \(props)")

Available log commands are:
trace, debug, info, warn, error, fatal

Available log enums are defined as:
    public enum LoggerVerbosity
    {
        case DEFAULT
        case MAXIMUM
        case VERBOSE
        case MINIMUM
    }
    
    public enum LoggerLevel: Int
    {
        case ALL = 0
        case TRACE = 10
        case DEBUG = 20
        case INFO = 30
        case WARN = 40
        case ERROR = 50
        case FATAL = 60
    }

