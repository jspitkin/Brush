//
//  strokeWidthChooser.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class strokeWidthChooser: UIControl {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        var widthChooserRect: CGRect = CGRectZero
        widthChooserRect.size.width = bounds.width
        widthChooserRect.size.height = bounds.height
        widthChooserRect.origin.x = 0.0
        widthChooserRect.origin.y = (bounds.height - widthChooserRect.height) * 0.5
        
        CGContextSetFillColorWithColor(context, UIColor.yellowColor().CGColor)
    }
}
