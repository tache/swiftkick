//
//  NumberTypeExtensions.swift
//  SwiftKick
//  https://github.com/dudash/swiftkick
//
//  Created by Christopher Graham on 5/28/16.
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


import UIKit
import Foundation

#if !(SK_IGNORE_INT)
extension Int {
    public var cgFloatValue:       CGFloat { return CGFloat(self) }
    public var degreesToRadians:   Double  { return Double(self) * .pi / 180 }
    public var radiansToDegrees:   Double  { return Double(self) * 180 / .pi }
    public static var random:Int { get { return Int.random(Int.max) } }
    public static func random(_ n: Int) -> Int { return Int(arc4random_uniform(UInt32(n))) }
    public static func random(_ min: Int, max: Int) -> Int { return Int.random(max - min + 1) + min }
}
#endif // #if SK_IGNORE

#if !(SK_IGNORE_DOUBLE)
extension Double {
    public var cgFloatValue:       CGFloat { return CGFloat(self) }
    public var degreesToRadians:   Double  { return self * .pi / 180 }
    public var radiansToDegrees:   Double  { return self * 180 / .pi }
    public static var random:Double { get { return Double(arc4random()) / 0xFFFFFFFF } }
    public static func random(_ min: Double, max: Double) -> Double { return Double.random * (max - min) + min }
}
#endif // #if SK_IGNORE

#if !(SK_IGNORE_CGFLOAT)
extension CGFloat {
    public var floatValue:         Float   { return Float(self) }
    public var doubleValue:        Double  { return Double(self) }
    public var degreesToRadians:   CGFloat { return CGFloat(doubleValue * .pi / 180) }
    public var radiansToDegrees:   CGFloat { return CGFloat(doubleValue * 180 / .pi) }
    public static var randomSign:CGFloat { get { return (arc4random_uniform(2) == 0) ? 1.0 : -1.0 } }
    public static var random:CGFloat { get { return CGFloat(Float.random) } }
    public static func random(_ min: CGFloat, max: CGFloat) -> CGFloat { return CGFloat.random * (max - min) + min }
}
#endif // #if SK_IGNORE

#if !(SK_IGNORE_FLOAT)
extension Float  {
    public var cgFloatValue:       CGFloat { return CGFloat(self) }
    public var doubleValue:        Double  { return Double(self) }
    public var degreesToRadians:   Float   { return Float(doubleValue * .pi / 180) }
    public var radiansToDegrees:   Float   { return Float(doubleValue * 180 / .pi) }
    public static var random:Float { get { return Float(arc4random()) / 0xFFFFFFFF } }
    public static func random(min: Float, max: Float) -> Float { return Float.random * (max - min) + min }
}
#endif // #if SK_IGNORE