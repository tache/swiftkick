//
//  LoggerLevel.swift
//  SwiftKick
//
//  Created by Christopher Graham on 10/28/15.

// SOME PORTION OF CODE FROM:
// https://github.com/honghaoz/Loggerithm
//
//  Type.swift
//  Loggerithm
//
//  Created by Honghao Zhang on 2015-08-13.
//  Copyright (c) 2015 Honghao Zhang (张宏昊)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

public enum LoggerLevel: Int {
    case VERBOSE    = 0
    case TRACE      = 10
    case DEBUG      = 20
    case INFO       = 30
    case WARN       = 40
    case ERROR      = 50
    case FATAL      = 60
    
    // Get string description for log level.
    static public func toString(logLevel: LoggerLevel) -> String
    {
        switch logLevel
        {
        case .VERBOSE:  return "VERBOSE"
        case .TRACE:    return "TRACE"
        case .DEBUG:    return "DEBUG"
        case .INFO:     return "INFO"
        case .WARN:     return "WARN"
        case .ERROR:    return "ERROR"
        case .FATAL:    return "FATAL"
        }
    }
    
    /// Defualt log level
    /// Be sure to set the "DEBUG" symbol.
    /// Set it in the "Swift Compiler - Custom Flags" section, "Other Swift Flags" line. Add "-D DEBUG" entry.
    #if DEBUG
        static public let defaultLevel = LoggerLevel.VERBOSE
    #else
        static public let defaultLevel = LoggerLevel.WARN
    #endif
}

// MARK: - Comparable
extension LoggerLevel: Comparable {}

public func <(lhs: LoggerLevel, rhs: LoggerLevel) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func <=(lhs: LoggerLevel, rhs: LoggerLevel) -> Bool {
    return lhs.rawValue <= rhs.rawValue
}

public func >=(lhs: LoggerLevel, rhs: LoggerLevel) -> Bool {
    return lhs.rawValue >= rhs.rawValue
}
