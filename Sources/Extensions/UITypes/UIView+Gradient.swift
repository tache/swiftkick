//
//  UIView+Gradient.swift
//  SwiftKick
//
//  Created by Jason on 1/28/16.
//  Copyright © 2016 Jason Dudash. All rights reserved.
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


#if !(SK_IGNORE_UIVIEWGRADIENT) // legacy

#if !(SK_IGNORE_UIVIEW)

import UIKit

// a gradient making extension for any UIView
public typealias ColorWithStop = (UIColor, Int?)

extension UIView {
    
    // From https://github.com/yingogobot/Swift-Useful-Extensions/blob/master/Swift-Useful-Extensions/UIView-ShortCuts.swift
    
    public var width:      CGFloat { return self.frame.size.width }
    public var height:     CGFloat { return self.frame.size.height }
    public var size:       CGSize  { return self.frame.size}
    
    public var origin:     CGPoint { return self.frame.origin }
    public var x:          CGFloat { return self.frame.origin.x }
    public var y:          CGFloat { return self.frame.origin.y }
    public var centerX:    CGFloat { return self.center.x }
    public var centerY:    CGFloat { return self.center.y }
    
    public var left:       CGFloat { return self.frame.origin.x }
    public var right:      CGFloat { return self.frame.origin.x + self.frame.size.width }
    public var top:        CGFloat { return self.frame.origin.y }
    public var bottom:     CGFloat { return self.frame.origin.y + self.frame.size.height }
    
    public func setWidth(_ width:CGFloat) { self.frame.size.width = width }
    
    public func setHeight(_ height:CGFloat) { self.frame.size.height = height }
    
    public func setSize(_ size:CGSize) { self.frame.size = size }
    
    public func setOrigin(_ point:CGPoint) { self.frame.origin = point }
    
    //only change the origin x
    public func setX(_ x:CGFloat) { self.frame.origin = CGPoint(x: x, y: self.frame.origin.y) }
    
    //only change the origin x
    public func setY(_ y:CGFloat) { self.frame.origin = CGPoint(x: self.frame.origin.x, y: y) }
    
    //only change the origin x
    public func setCenterX(_ x:CGFloat) { self.center = CGPoint(x: x, y: self.center.y) }
    
    //only change the origin x
    public func setCenterY(_ y:CGFloat) { self.center = CGPoint(x: self.center.x, y: y) }
    
    public func roundCorner(_ radius:CGFloat) { self.layer.cornerRadius = radius }
    
    public func setTop(_ top:CGFloat) { self.frame.origin.y = top }
    
    public func setLeft(_ left:CGFloat) { self.frame.origin.x = left }
    
    public func setRight(_ right:CGFloat) { self.frame.origin.x = right - self.frame.size.width }
    
    public func setBottom(_ bottom:CGFloat) { self.frame.origin.y = bottom - self.frame.size.height }
    
    //--------------------------------------------------------------------------
    
    public func addLinearGradientLayer(_ colors:ColorWithStop...) {
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size
        layer.frame.origin = self.frame.origin
        
        //        layer.frame = self.bounds
        
        layer.colors = []
        
        for color in colors {
            let thecolor:CGColor = color.0.cgColor
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
            if color.1 != nil {
                if layer.locations == nil { layer.locations = [] }
                let number = NSNumber(integerLiteral: (color.1! / 100))
                layer.locations?.append(number)
            }
            else {
                // no color-stops, use start and end
                layer.startPoint = CGPoint(x: 0, y: 0)
                layer.endPoint = CGPoint(x: 0, y: 1)
                layer.locations = nil
            }
            layer.colors?.append(thecolor)
        }
        
        let fadeAnimation = CAKeyframeAnimation(keyPath:"opacity")
        fadeAnimation.beginTime = CACurrentMediaTime()
        fadeAnimation.duration = 1.0
        fadeAnimation.keyTimes = [0, 1]
        fadeAnimation.values = [0.0, 1.0]
        fadeAnimation.isRemovedOnCompletion = false
        fadeAnimation.fillMode = kCAFillModeForwards
        layer.add(fadeAnimation, forKey:"animateOpacity")
        self.layer.addSublayer(layer)
        
        // Kludge: remove layers if more than a few, that way it looks seemless
        // when fading in the new layer but we don't rack up memory
        if self.layer.sublayers != nil {
            while self.layer.sublayers!.count > 3 {
                let byebyelayer = self.layer.sublayers![0]
                byebyelayer.removeFromSuperlayer()
            }
        }
    }
}

#endif // #if SK_IGNORE_UIVIEW
#endif // SK_IGNORE_UIVIEWGRADIENT legacy