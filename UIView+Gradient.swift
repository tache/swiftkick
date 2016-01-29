//
//  UIView+Gradient.swift
//  SwiftKick
//
//  Created by Jason on 1/28/16.
//  Copyright © 2016 Jason Dudash. All rights reserved.
//

#if SK_IGNORE_UIVIEWGRADIENT
//ignoring
#else

import UIKit

// a gradient making extension for any UIView
typealias ColorWithStop = (UIColor, Int?)

extension UIView {
    
    // From https://github.com/yingogobot/Swift-Useful-Extensions/blob/master/Swift-Useful-Extensions/UIView-ShortCuts.swift
    
    var width:      CGFloat { return self.frame.size.width }
    var height:     CGFloat { return self.frame.size.height }
    var size:       CGSize  { return self.frame.size}
    
    var origin:     CGPoint { return self.frame.origin }
    var x:          CGFloat { return self.frame.origin.x }
    var y:          CGFloat { return self.frame.origin.y }
    var centerX:    CGFloat { return self.center.x }
    var centerY:    CGFloat { return self.center.y }
    
    var left:       CGFloat { return self.frame.origin.x }
    var right:      CGFloat { return self.frame.origin.x + self.frame.size.width }
    var top:        CGFloat { return self.frame.origin.y }
    var bottom:     CGFloat { return self.frame.origin.y + self.frame.size.height }
    
    func setWidth(width:CGFloat) { self.frame.size.width = width }
    
    func setHeight(height:CGFloat) { self.frame.size.height = height }
    
    func setSize(size:CGSize) { self.frame.size = size }
    
    func setOrigin(point:CGPoint) { self.frame.origin = point }
    
    //only change the origin x
    func setX(x:CGFloat) { self.frame.origin = CGPointMake(x, self.frame.origin.y) }
    
    //only change the origin x
    func setY(y:CGFloat) { self.frame.origin = CGPointMake(self.frame.origin.x, y) }
    
    //only change the origin x
    func setCenterX(x:CGFloat) { self.center = CGPointMake(x, self.center.y) }
    
    //only change the origin x
    func setCenterY(y:CGFloat) { self.center = CGPointMake(self.center.x, y) }
    
    func roundCorner(radius:CGFloat) { self.layer.cornerRadius = radius }
    
    func setTop(top:CGFloat) { self.frame.origin.y = top }
    
    func setLeft(left:CGFloat) { self.frame.origin.x = left }
    
    func setRight(right:CGFloat) { self.frame.origin.x = right - self.frame.size.width }
    
    func setBottom(bottom:CGFloat) { self.frame.origin.y = bottom - self.frame.size.height }
    
    //--------------------------------------------------------------------------
    
    func addLinearGradientLayer(colors:ColorWithStop...) {
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size
        layer.frame.origin = self.frame.origin
        
        //        layer.frame = self.bounds
        
        layer.colors = []
        
        for color in colors {
            let thecolor:CGColor = color.0.CGColor
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
            if color.1 != nil {
                if layer.locations == nil { layer.locations = [] }
                layer.locations?.append(color.1!/100)
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
        fadeAnimation.removedOnCompletion = false
        fadeAnimation.fillMode = kCAFillModeForwards
        layer.addAnimation(fadeAnimation, forKey:"animateOpacity")
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

#endif // #if SK_IGNORE_UIVIEWGRADIENT
