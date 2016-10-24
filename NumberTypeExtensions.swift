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


#if !(SK_IGNORE_NUMBEREXT)

import UIKit
import Foundation

extension Int {
    var cgFloatValue:       CGFloat { return CGFloat(self) }
    var degreesToRadians:   Double  { return Double(self) * M_PI / 180 }
    var radiansToDegrees:   Double  { return Double(self) * 180 / M_PI }
}

extension Double {
    var cgFloatValue:       CGFloat { return CGFloat(self) }
    var degreesToRadians:   Double  { return self * M_PI / 180 }
    var radiansToDegrees:   Double  { return self * 180 / M_PI }
}

extension CGFloat {
    var floatValue:         Float   { return Float(self) }
    var doubleValue:        Double  { return Double(self) }
    var degreesToRadians:   CGFloat { return CGFloat(doubleValue * M_PI / 180) }
    var radiansToDegrees:   CGFloat { return CGFloat(doubleValue * 180 / M_PI) }
}

extension Float  {
    var cgFloatValue:       CGFloat { return CGFloat(self) }
    var doubleValue:        Double  { return Double(self) }
    var degreesToRadians:   Float   { return Float(doubleValue * M_PI / 180) }
    var radiansToDegrees:   Float   { return Float(doubleValue * 180 / M_PI) }
}

#endif // #if SK_IGNORE_NUMBEREXT
