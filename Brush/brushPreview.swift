//
//  brushPreview.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class brushPreview: UIControl {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        var brushPreviewRect: CGRect = CGRectZero
        brushPreviewRect.size.width = bounds.width
        brushPreviewRect.size.height = bounds.height
        brushPreviewRect.origin.x = 0.0
        brushPreviewRect.origin.y = (bounds.height - wheelRect.height) * 0.5
        
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
    }
}
