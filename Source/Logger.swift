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
    
    private var level_:LoggerLevel = LoggerLevel.WARN
    private var verbosity_ = LoggerVerbosity.DEFAULT
    private var stream_:String = "stdout"
    
    //-----------------------------------------------------------------------------------------------
    public init() {}
    public init(level:LoggerLevel=LoggerLevel.WARN, verbosity:LoggerVerbosity=LoggerVerbosity.DEFAULT, stream:String="stdout")
    {
        level_ = level
        verbosity_  = verbosity
        stream_ = stream
    }
    
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
    public func trace(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        if level_.rawValue > LoggerLevel.TRACE.rawValue { return }
        println("TRACE:" + getPrefix(fx, file:file, ln:ln, col:col) + message)
    }
    
    //-----------------------------------------------------------------------------------------------
    public func debug(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        if level_.rawValue > LoggerLevel.DEBUG.rawValue { return }
        let stamp = getTimestamp();
        println("DEBUG:" + getPrefix(fx, file:file, ln:ln, col:col) + message)
    }
    
    //-----------------------------------------------------------------------------------------------
    public func info(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        if level_.rawValue > LoggerLevel.INFO.rawValue { return }
        println("INFO:" + getPrefix(fx, file:file, ln:ln, col:col) + message)
    }
    
    //-----------------------------------------------------------------------------------------------
    public func warn(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        if level_.rawValue > LoggerLevel.WARN.rawValue { return }
        println("WARN:" + getPrefix(fx, file:file, ln:ln, col:col) + message)
    }
    
    //-----------------------------------------------------------------------------------------------
    public func error(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        if level_.rawValue > LoggerLevel.ERROR.rawValue { return }
        println("ERROR:" + getPrefix(fx, file:file, ln:ln, col:col) + message)
    }
    
    //-----------------------------------------------------------------------------------------------
    public func fatal(message:String, fx:String=__FUNCTION__, file:String=__FILE__, ln:Int=__LINE__, col:Int=__COLUMN__)
    {
        if level_.rawValue > LoggerLevel.FATAL.rawValue { return }
        println("FATAL:" + getPrefix(fx, file:file, ln:ln, col:col) + message)
    }
}
