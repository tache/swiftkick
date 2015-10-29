//
//  LoggerLevel.swift
//  SwiftKick
//
//  Created by Christopher Graham on 10/28/15.
//  Copyright (c) 2015 Jason Dudash. All rights reserved.
//

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
    static public func descriptionForLogLevel(logLevel: LoggerLevel) -> String {
        switch logLevel {
        case .VERBOSE:  return "VERBOSE"
        case .TRACE:    return "TRACE"
        case .DEBUG:    return "DEBUG"
        case .INFO:     return "INFO"
        case .WARN:     return "WARN"
        case .ERROR:    return "ERROR"
        case .FATAL:    return "FATAL"
        default: assertionFailure("Invalid level")
        return "Null"
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
