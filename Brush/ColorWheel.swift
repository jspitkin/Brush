//
//  ColorWheel.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class ColorWheel: UIView {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        var wheelRect: CGRect = CGRectZero
        wheelRect.size.width = bounds.width
        wheelRect.size.height = bounds.height
        wheelRect.origin.x = 0.0
        wheelRect.origin.y = (bounds.height - wheelRect.height) * 0.5
        
        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextFillEllipseInRect(context, wheelRect)
    }
}
