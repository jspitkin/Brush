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
        
        let widthSlider: UISlider = UISlider(frame: CGRectMake(5, 0, bounds.width - 10, bounds.height))
        addSubview(widthSlider)
        
    }
}
