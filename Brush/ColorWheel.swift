//
//  ColorWheel.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class ColorWheel: UIControl {
    private var _color: UIColor = UIColor.whiteColor()
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        print("Began touchPoint: (\(touchPoint.x), \(touchPoint.y))")
        getColor()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        print("Moved touchPoint: (\(touchPoint.x), \(touchPoint.y))")
        getColor()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        print("End touchPoint: (\(touchPoint.x), \(touchPoint.y))")
        getColor()
    }
    
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
    
    func getColor() {
        // TODO: Get color that is selected on color wheel
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    var color: UIColor { return _color }
}
