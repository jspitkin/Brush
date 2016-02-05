//
//  strokeEndCapChooser.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class strokeEndCapChooser: UIControl {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        var endCapRect: CGRect = CGRectZero
        endCapRect.size.width = bounds.width
        endCapRect.size.height = bounds.height
        endCapRect.origin.x = 0.0
        endCapRect.origin.y = (bounds.height - endCapRect.height) * 0.5
        
        CGContextSetFillColorWithColor(context, UIColor.greenColor().CGColor)
    }
}
