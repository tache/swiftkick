//
//  UIImage+Tint.swift
//  SwiftKick
//
//  Created by Jason on 1/28/16.
//  Copyright © 2016 Jason Dudash. All rights reserved.
//

#if SK_IGNORE_UIIMAGETINT
    //ignoring
#else

import UIKit
extension UIImage {
    var halfSizeImage: UIImage? {
            let halfWidth = self.size.width / 2
            let halfHeight = self.size.height / 2
            UIGraphicsBeginImageContext(CGSize(width: halfWidth, height: halfHeight))
            self.drawInRect(CGRectMake(0, 0, halfWidth, halfHeight))
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
    }
    
    //--------------------------------------------------------------------------
    
    func tint(color: UIColor, blendMode: CGBlendMode) -> UIImage {
        let drawRect = CGRectMake(0.0, 0.0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        CGContextClipToMask(context, drawRect, CGImage)
        color.setFill()
        UIRectFill(drawRect)
        drawInRect(drawRect, blendMode: blendMode, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage
    }
    
}
    
#endif //#if SK_IGNORE_UIIMAGETINT