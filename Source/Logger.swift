//
//  Logger.swift
//  SwiftKick
//  https://github.com/dudash/swiftkick
//  Created by Jason Dudash on 9/28/14.
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

import Foundation

public class Logger
{
    public enum LoggerVerbosity
    {
        case DEFAULT
        case MAXIMUM
        case VERBOSE
        case MINIMUM
    }
    
    private var level_:LoggerLevel = LoggerLevel.WARN
    private var verbosity_ = LoggerVerbosity.DEFAULT
    private var stream_:String = "stdout"

    /// output color log flag
    public var coloredLogFlag = false
    
    //-----------------------------------------------------------------------------------------------

    /// Color used for verbose message logging string.
    public var verboseColor: Color? {
        set {
            LoggerColor.verboseColor = newValue
        }
        
        get {
            return LoggerColor.verboseColor
        }
    }
    
    /// Color used for trace message logging string.
    public var traceColor: Color? {
        set {
            LoggerColor.traceColor = newValue
        }
        
        get {
            return LoggerColor.traceColor
        }
    }
    
    /// Color used for debug log string.
    public var debugColor: Color? {
        set {
            LoggerColor.debugColor = newValue
        }
        
        get {
            return LoggerColor.debugColor
        }
    }
    
    /// Color used for info log string.
    public var infoColor: Color? {
        set {
            LoggerColor.infoColor = newValue
        }
        
        get {
            return LoggerColor.infoColor
        }
    }
    
    /// Color used for warning log string.
    public var warnColor: Color? {
        set {
            LoggerColor.warnColor = newValue
        }
        
        get {
            return LoggerColor.warnColor
        }
    }
    
    /// Color used for error log string.
    public var errorColor: Color? {
        set {
            LoggerColor.errorColor = newValue
        }
        
        get {
            return LoggerColor.errorColor
        }
    }
    
    /// Color used for error log string.
    public var fatalColor: Color? {
        set {
            LoggerColor.fatalColor = newValue
        }
        
        get {
            return LoggerColor.fatalColor
        }
    }
    
    //-----------------------------------------------------------------------------------------------

    /// LogFunction used, print for DEBUG, NSLog for Production.
    #if DEBUG
    private let LogFunction: (format: String) -> Void = {format in print(format)}
    private let UsingNSLog = false
    #else
    private let LogFunction: (format: String, args: CVarArgType...) -> Void = NSLog
    private let UsingNSLog = true
    #endif

    //-----------------------------------------------------------------------------------------------

    public init() {}
    public init(level:LoggerLevel=LoggerLevel.WARN, verbosity:LoggerVerbosity=LoggerVerbosity.DEFAULT, stream:String="stdout")
    {
        level_ = level
        verbosity_  = verbosity
        stream_ = stream
        
        // Check to see whether XcodeColors is installed and enabled
        // useColorfulLog will be turned on when environment variable "XcodeColors" == "YES"
        //        if let xcodeColorsEnabled = NSProcessInfo().environment["XcodeColors"] as! String? where xcodeColorsEnabled == "YES" {
        //            coloredLogFlag = true
        //        }
    }
    
    //-----------------------------------------------------------------------------------------------

    func setLogLevel(level:LoggerLevel) {
        level_ = level
    }
    
    //-----------------------------------------------------------------------------------------------

    // MARK: Formatting Messages
    
    //-----------------------------------------------------------------------------------------------

    private func getTimestamp() -> String
    {
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        return "\(timestamp)"
    }
    
    //-----------------------------------------------------------------------------------------------

    private func getPrefix(fx:String, file:String, ln:Int, col:Int) -> String
    {
        let url:NSURL? = NSURL(string:file)
        if url != nil && verbosity_ == LoggerVerbosity.DEFAULT { return "[\(getTimestamp())] \(url!.lastPathComponent!):\(ln) - " }
        else if url != nil && verbosity_ == LoggerVerbosity.VERBOSE { return "[\(getTimestamp())] \(url!.lastPathComponent!)/\(fx):\(ln) - " }
        else if verbosity_ == LoggerVerbosity.MINIMUM {return "[\(getTimestamp())] " }
        else if verbosity_ == LoggerVerbosity.MAXIMUM { return "[\(getTimestamp())] \(file)/\(fx):\(ln),\(col) - " }
        else if url != nil { return "[\(getTimestamp())] \(url!.lastPathComponent!):\(ln) - " }
        else { return "[\(getTimestamp())] UNKNOWN_FILE:\(ln) - " }
    }
    
    // MARK: Methods to Print
    
    //-----------------------------------------------------------------------------------------------

    public func logIt(message:String, level:LoggerLevel, fx:String, file:String, ln:Int, col:Int) {
        if level_.rawValue > level.rawValue { return }
        let logString = "\(LoggerLevel.descriptionForLogLevel(level)):" + getPrefix(fx, file:file, ln:ln, col:col) + message
        let outputString = coloredLogFlag ? LoggerColor.applyColorForLogString(logString, withLevel: level) : logString
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.LogFunction(format: outputString)
        })
    }

    public func verbose(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        logIt(message, level: LoggerLevel.VERBOSE, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func trace(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        logIt(message, level: LoggerLevel.TRACE, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func debug(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        logIt(message, level: LoggerLevel.DEBUG, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func info(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        logIt(message, level: LoggerLevel.INFO, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func warn(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        logIt(message, level: LoggerLevel.WARN, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func error(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        logIt(message, level: LoggerLevel.ERROR, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func fatal(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        logIt(message, level: LoggerLevel.FATAL, fx: fx, file: file, ln: ln, col: col)
    }

    //-----------------------------------------------------------------------------------------------

    public func emptyLine() {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.LogFunction(format: "\n")
        })
    }

}
