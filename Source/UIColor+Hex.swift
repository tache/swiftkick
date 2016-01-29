//
//  UIColor+Hex.swift
//  SwiftKick
//
//  Created by Jason on 1/28/16.
//  Copyright © 2016 Jason Dudash. All rights reserved.
//

#if SK_IGNORE_UICOLORHEX
    //ignoring
#else
    
import UIKit
extension UIColor {
    convenience init(fromHex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((fromHex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((fromHex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((fromHex & 0xFF)) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
    
#endif // #if SK_IGNORE_UICOLORHEX