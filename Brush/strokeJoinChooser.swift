//
//  strokeJoinChooser.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class strokeJoinChooser: UIControl {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        var joinChooserRect: CGRect = CGRectZero
        joinChooserRect.size.width = bounds.width
        joinChooserRect.size.height = bounds.height
        joinChooserRect.origin.x = 0.0
        joinChooserRect.origin.y = (bounds.height - joinChooserRect.height) * 0.5
        
    }
}
