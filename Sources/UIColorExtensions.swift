//
//  UIColorExtension.swift
//  SwiftKick
//  https://github.com/dudash/swiftkick
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

#if !(SK_IGNORE_UICOLORHEX)

import UIKit

extension UIColor {

    var coreImageColor: CoreImage.CIColor? {
        return CoreImage.CIColor(color: self)  // The resulting Core Image color, or nil
    }

    //--------------------------------------------------------------------------

    // Flat UI colors from http://flatuicolors.com

    // green sea
    public class func turquoiseColor()    -> UIColor { return UIColor(fromHex:0x1abc9c, alpha: 1.0) }
    public class func greenSeaColor()     -> UIColor { return UIColor(fromHex:0x16a085, alpha: 1.0) }
    // green
    public class func emeraldColor()      -> UIColor { return UIColor(fromHex:0x2ecc71, alpha: 1.0) }
    public class func nephritisColor()    -> UIColor { return UIColor(fromHex:0x27ae60, alpha: 1.0) }
    // blue
    public class func peterRiverColor()   -> UIColor { return UIColor(fromHex:0x3498db, alpha: 1.0) }
    public class func belizeHoleColor()   -> UIColor { return UIColor(fromHex:0x2980b9, alpha: 1.0) }
    // purple
    public class func amethystColor()     -> UIColor { return UIColor(fromHex:0x9b59b6, alpha: 1.0) }
    public class func wisteriaColor()     -> UIColor { return UIColor(fromHex:0x8e44ad, alpha: 1.0) }
    // dark blue
    public class func wetAsphaltColor()   -> UIColor { return UIColor(fromHex:0x34495e, alpha: 1.0) }
    public class func midnightBlueColor() -> UIColor { return UIColor(fromHex:0x2c3e50, alpha: 1.0) }
    // yellow
    public class func sunFlowerColor()    -> UIColor { return UIColor(fromHex:0xf1c40f, alpha: 1.0) }
    public class func flatOrangeColor()   -> UIColor { return UIColor(fromHex:0xf39c12, alpha: 1.0) }
    // orange
    public class func carrotColor()       -> UIColor { return UIColor(fromHex:0xe67e22, alpha: 1.0) }
    public class func pumkinColor()       -> UIColor { return UIColor(fromHex:0xd35400, alpha: 1.0) }
    // red
    public class func alizarinColor()     -> UIColor { return UIColor(fromHex:0xe74c3c, alpha: 1.0) }
    public class func pomegranateColor()  -> UIColor { return UIColor(fromHex:0xc0392b, alpha: 1.0) }
    // white
    public class func cloudsColor()       -> UIColor { return UIColor(fromHex:0xecf0f1, alpha: 1.0) }
    public class func silverColor()       -> UIColor { return UIColor(fromHex:0xbdc3c7, alpha: 1.0) }
    // gray
    public class func asbestosColor()     -> UIColor { return UIColor(fromHex:0x7f8c8d, alpha: 1.0) }
    public class func concerteColor()     -> UIColor { return UIColor(fromHex:0x95a5a6, alpha: 1.0) }

    //--------------------------------------------------------------------------

    public func getHSBAComponents() -> (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)?
    {
        var (hue, saturation, brightness, alpha) = (CGFloat(0.0), CGFloat(0.0), CGFloat(0.0), CGFloat(0.0))
        if self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        {
            return (hue, saturation, brightness, alpha)
        }
        else
        {
            return nil
        }
    }

}

#endif // #if SK_IGNORE_UICOLORHEX
