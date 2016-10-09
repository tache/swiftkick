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
            self.draw(in: CGRect(x: 0, y: 0, width: halfWidth, height: halfHeight))
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
    }
    
    //--------------------------------------------------------------------------
    
    func tint(_ color: UIColor, blendMode: CGBlendMode) -> UIImage {
        let drawRect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        context!.clip(to: drawRect, mask: cgImage!)
        color.setFill()
        UIRectFill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
    
}
    
#endif //#if SK_IGNORE_UIIMAGETINT
