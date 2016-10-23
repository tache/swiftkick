//
//  MathExtensions.swift
//  WheelOfWhat
//
//  Created by Christopher Graham on 5/28/16.
//  Copyright © 2016 Mondo Cool Studios LLC. All rights reserved.
//

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


