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

open class Logger
{
    public enum LoggerVerbosity
    {
        case `default`
        case maximum
        case verbose
        case minimum
    }
    
    fileprivate var level_:LoggerLevel = LoggerLevel.warn
    fileprivate var verbosity_ = LoggerVerbosity.default
    fileprivate var stream_:String = "stdout"

    /// output color log flag (requires: XcodeColors)
    open var colored_ = false
    
    //-----------------------------------------------------------------------------------------------

    /// LogFunction used, print for DEBUG, NSLog for Production.
    #if DEBUG
    private let LogFunction: (_ format: String) -> Void = {format in print(format)}
    private let UsingNSLog = false
    #else
    fileprivate let LogFunction: (_ format: String, _ args: CVarArg...) -> Void = NSLog
    fileprivate let UsingNSLog = true
    #endif

    //-----------------------------------------------------------------------------------------------

    public init() {}
    public init(_ level:LoggerLevel=LoggerLevel.warn, verbosity:LoggerVerbosity=LoggerVerbosity.default, stream:String="stdout", colored:Bool=false )
    {
        level_ = level
        verbosity_  = verbosity
        stream_ = stream
        colored_ = colored
    }
    
    //-----------------------------------------------------------------------------------------------

    open func changeLogLevel(_ level:LoggerLevel) { level_ = level }
    
    //-----------------------------------------------------------------------------------------------

    // MARK: Formatting Messages
    
    //-----------------------------------------------------------------------------------------------

    fileprivate func getTimestamp() -> String
    {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        return "\(timestamp)"
    }
    
    //-----------------------------------------------------------------------------------------------

    fileprivate func getPrefix(_ fx:String, file:String, ln:Int, col:Int) -> String
    {
        let url:URL? = URL(string:file)
        if url != nil && verbosity_ == LoggerVerbosity.default { return "[\(getTimestamp())] \(url!.lastPathComponent):\(ln) - " }
        else if url != nil && verbosity_ == LoggerVerbosity.verbose { return "[\(getTimestamp())] \(url!.lastPathComponent)/\(fx):\(ln) - " }
        else if verbosity_ == LoggerVerbosity.minimum {return "[\(getTimestamp())] " }
        else if verbosity_ == LoggerVerbosity.maximum { return "[\(getTimestamp())] \(file)/\(fx):\(ln),\(col) - " }
        else if url != nil { return "[\(getTimestamp())] \(url!.lastPathComponent):\(ln) - " }
        else { return "[\(getTimestamp())] UNKNOWN_FILE:\(ln) - " }
    }
    
    // MARK: Methods to Print
    
    //-----------------------------------------------------------------------------------------------

    open func logIt(_ message:String, level:LoggerLevel, fx:String, file:String, ln:Int, col:Int)
    {
        if level_.rawValue > level.rawValue { return }
        let logString = "\(LoggerLevel.toString(level)):" + getPrefix(fx, file:file, ln:ln, col:col) + message
        let outputString = colored_ ? LoggerColor.applyColorForLogString(logString, withLevel: level) : logString
        DispatchQueue.main.async(execute: { () -> Void in self.LogFunction(outputString)})
    }

    //-----------------------------------------------------------------------------------------------

    open func always(_ message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.always, fx: fx, file: file, ln: ln, col: col)   
    }

    //-----------------------------------------------------------------------------------------------
    // keep this in for legacy support, but use of always is prefered
    open func verbose(_ message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.always, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    open func trace(_ message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.trace, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    open func debug(_ message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.debug, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    open func info(_ message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.info, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    open func warn(_ message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.warn, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    open func error(_ message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.error, fx: fx, file: file, ln: ln, col: col)
    }
    
    //-----------------------------------------------------------------------------------------------

    open func fatal(_ message:String, fx:String=#function, file:String=#file, ln:Int=#line, col:Int=#column)
    {
        logIt(message, level: LoggerLevel.fatal, fx: fx, file: file, ln: ln, col: col)
    }

    //-----------------------------------------------------------------------------------------------

    open func emptyLine()
    {
        DispatchQueue.main.async(execute: { () -> Void in self.LogFunction("\n")})
    }

}
