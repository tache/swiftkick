//
//  Color.swift
//  SwiftKick
//  https://github.com/dudash/swiftkick
//  Created by Christopher Graham on 10/28/15.

// MAJORITY OF SOURCE FROM:
// https://github.com/honghaoz/Loggerithm
//
//  Color.swift
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

#if os(iOS)
    import UIKit
    public typealias Color = UIColor
#elseif os(tvOS)
    import UIKit
    public typealias Color = UIColor
#elseif os(OSX)
    import Cocoa
    public typealias Color = NSColor
#endif

struct LoggerColor {
    static fileprivate let ESCAPE = "\u{001b}["
    
    static fileprivate let RESET_FG = ESCAPE + "fg;" // Clear any foreground color
    static fileprivate let RESET_BG = ESCAPE + "bg;" // Clear any background color
    static fileprivate let RESET = ESCAPE + ";"   // Clear any foreground or background color
    
    /// RGB Color components.
    typealias ColorTuple = (r: Int, g: Int, b: Int)
    
    //-----------------------------------------------------------------------------------------------
    
    /// Color for verbose log strings.
    static var verboseColor: Color? {
        didSet {
            if let verboseColor = verboseColor {
                verboseColorTuple = colorTupleForColor(verboseColor)
            } else {
                verboseColorTuple = defaultVerboseColorTuple
            }
        }
    }
    
    /// Color for verbose log strings.
    static var traceColor: Color? {
        didSet {
            if let traceColor = traceColor {
                traceColorTuple = colorTupleForColor(traceColor)
            } else {
                traceColorTuple = defaultTraceColorTuple
            }
        }
    }
    
    /// Color for debug log strings.
    static var debugColor: Color? {
        didSet {
            if let debugColor = debugColor {
                debugColorTuple = colorTupleForColor(debugColor)
            } else {
                debugColorTuple = defaultDebugColorTuple
            }
        }
    }
    
    /// Color for info log strings.
    static var infoColor: Color? {
        didSet {
            if let infoColor = infoColor {
                infoColorTuple = colorTupleForColor(infoColor)
            } else {
                infoColorTuple = defaultInfoColorTuple
            }
        }
    }
    
    /// Color for warning log strings.
    static var warnColor: Color? {
        didSet {
            if let warnColor = warnColor {
                warnColorTuple = colorTupleForColor(warnColor)
            } else {
                warnColorTuple = defaultWarnColorTuple
            }
        }
    }
    
    /// Color for error log strings.
    static var errorColor: Color? {
        didSet {
            if let errorColor = errorColor {
                errorColorTuple = colorTupleForColor(errorColor)
            } else {
                errorColorTuple = defaultErrorColorTuple
            }
        }
    }
    
    /// Color for error log strings.
    static var fatalColor: Color? {
        didSet {
            if let fatalColor = fatalColor {
                fatalColorTuple = colorTupleForColor(fatalColor)
            } else {
                fatalColorTuple = defaultFatalColorTuple
            }
        }
    }
    
    //-----------------------------------------------------------------------------------------------
    
    /// Default color rgb components for verbose string.
    static fileprivate var defaultVerboseColorTuple = ColorTuple(r: 190, g: 190, b: 190)
    /// Default color rgb components for debug string.
    static fileprivate var defaultTraceColorTuple = ColorTuple(r: 148, g: 187, b: 9)
    /// Default color rgb components for debug string.
    static fileprivate var defaultDebugColorTuple = ColorTuple(r: 60, g: 161, b: 202)
    /// Default color rgb components for info string.
    static fileprivate var defaultInfoColorTuple = ColorTuple(r: 253, g: 190, b: 10)
    /// Default color rgb components for warning string.
    static fileprivate var defaultWarnColorTuple = ColorTuple(r: 251, g: 127, b: 8)
    /// Default color rgb components for error string.
    static fileprivate var defaultErrorColorTuple = ColorTuple(r: 247, g: 13, b: 23)
    /// Default color rgb components for error string.
    static fileprivate var defaultFatalColorTuple = ColorTuple(r: 220, g: 62, b: 53)
    
    /// Color rgb components for verbose string.
    static fileprivate var verboseColorTuple = defaultVerboseColorTuple
    /// Color rgb components for debug string.
    static fileprivate var traceColorTuple = defaultTraceColorTuple
    /// Color rgb components for debug string.
    static fileprivate var debugColorTuple = defaultDebugColorTuple
    /// Color rgb components for info string.
    static fileprivate var infoColorTuple = defaultInfoColorTuple
    /// Color rgb components for warning string.
    static fileprivate var warnColorTuple = defaultWarnColorTuple
    /// Color rgb components for error string.
    static fileprivate var errorColorTuple = defaultErrorColorTuple
    /// Color rgb components for error string.
    static fileprivate var fatalColorTuple = defaultFatalColorTuple
    
    
    //-----------------------------------------------------------------------------------------------
    
    /**
    Add color setting code for a string.
    
    - parameter logString: A string
    - parameter level:     A log level
    
    - returns: A string with color setting code inserted.
    */
    static func applyColorForLogString(_ logString: String, withLevel level: LoggerLevel) -> String {
        let (red, green, blue) = rgbForLogLevel(level)
        return "\(ESCAPE)fg\(red),\(green),\(blue);\(logString)\(RESET)"
    }
    
    
    //-----------------------------------------------------------------------------------------------
    
    /**
    Get corresponding color tuple for log level.
    
    - parameter level: A log level
    
    - returns: ColorTuple instance.
    */
    static fileprivate func rgbForLogLevel(_ level: LoggerLevel) -> ColorTuple {
        switch level {
        case .always: return verboseColorTuple
        case .trace: return traceColorTuple
        case .debug: return debugColorTuple
        case .info: return infoColorTuple
        case .warn: return warnColorTuple
        case .error: return errorColorTuple
        case .fatal: return fatalColorTuple
        }
    }
    
    
    //-----------------------------------------------------------------------------------------------
    
    /**
    Get corresponding color tuple for an UIColor/NSColor.
    
    - parameter color: UIColor for iOS, NSColor for OSX
    
    - returns: ColorTuple instance.
    */
    static fileprivate func colorTupleForColor(_ color: Color) -> ColorTuple {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        color.getRed(&red, green: &green, blue: &blue, alpha: nil)
        return ColorTuple(r: Int(red * 255), g: Int(green * 255), b: Int(blue * 255))
    }
}
