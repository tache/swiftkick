//
//  Logger.swift
//  SwiftKick
//  https://github.com/dudash/swiftkick
//  Created by Jason Dudash on 9/28/14.
//
//    The MIT License (MIT)
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

//
//  Refactored by Christopher Graham on 10/28/15.
// --> merged with color support from here: https://github.com/honghaoz/Loggerithm
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

    /// output color log flag (requires: XcodeColors)
    public var colored_ = false
    
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
    public init(level:LoggerLevel=LoggerLevel.WARN, verbosity:LoggerVerbosity=LoggerVerbosity.DEFAULT, stream:String="stdout", colored:Bool=false )
    {
        level_ = level
        verbosity_  = verbosity
        stream_ = stream
        colored_ = colored
    }
    
    //-----------------------------------------------------------------------------------------------

    public func changeLogLevel(level:LoggerLevel) { level_ = level }
    
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

    public func logIt(message:String, level:LoggerLevel, fx:String, file:String, ln:Int, col:Int)
    {
        if level_.rawValue > level.rawValue { return }
        let logString = "\(LoggerLevel.toString(level)):" + getPrefix(fx, file:file, ln:ln, col:col) + message
        let outputString = colored_ ? LoggerColor.applyColorForLogString(logString, withLevel: level) : logString
        dispatch_async(dispatch_get_main_queue(), { () -> Void in self.LogFunction(format: outputString)})
    }

    //-----------------------------------------------------------------------------------------------

    public func always(message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.ALWAYS, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func trace(message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.TRACE, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func debug(message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.DEBUG, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func info(message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.INFO, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func warn(message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.WARN, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func error(message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.ERROR, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    public func fatal(message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.FATAL, fx: fx, file: file, ln: ln, col: col)
    }

    //-----------------------------------------------------------------------------------------------

    public func emptyLine()
    {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in self.LogFunction(format: "\n")})
    }

}
