//
//  strokeJoinChooser.swift
//  Brush
//
//  Created by Jake Pitkin on 2/5/16.
//  Copyright © 2016 Jake Pitkin. All rights reserved.
//

import UIKit

class strokeJoinChooser: UIControl {
    private var _join: CGLineJoin!
    
    private var _miterPath :CGMutablePathRef?
    private var _roundPath :CGMutablePathRef?
    private var _bevelPath :CGMutablePathRef?
    
    private var _miterButtonColor :CGColor!
    private var _roundButtonColor :CGColor!
    private var _bevelButtonColor :CGColor!
    
    private var _miterButton :UIButton!
    private var _roundButton :UIButton!
    private var _bevelButton :UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _join = CGLineJoin.Round
        _miterButtonColor = UIColor.whiteColor().CGColor
        _roundButtonColor = UIColor.yellowColor().CGColor
        _bevelButtonColor = UIColor.whiteColor().CGColor
        _miterPath = CGPathCreateMutable()
        _roundPath = CGPathCreateMutable()
        _bevelPath = CGPathCreateMutable()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, CGFloat(15))
        CGContextSetStrokeColorWithColor(context, _miterButtonColor)
        CGContextSetLineCap(context, CGLineCap.Square)
        CGContextSetLineJoin(context, CGLineJoin.Miter)
        CGPathMoveToPoint(_miterPath, nil, bounds.width * 0.115, bounds.height * 0.8)
        CGPathAddLineToPoint(_miterPath, nil, bounds.width * 0.175, bounds.height * 0.4)
        CGPathAddLineToPoint(_miterPath, nil, bounds.width * 0.235, bounds.height * 0.8)
        CGContextAddPath(context, _miterPath)
        CGContextStrokePath(context)
        
        _miterButton = UIButton(frame: CGRect(x: bounds.width * 0.08, y: bounds.height * 0.2, width: bounds.width * 0.190, height: bounds.height * 0.75))
        _miterButton.backgroundColor = UIColor.clearColor()
        _miterButton.addTarget(self, action: "setJoinToMiter", forControlEvents: .TouchUpInside)
        addSubview(_miterButton)
        
        CGContextSetLineWidth(context, CGFloat(15))
        CGContextSetStrokeColorWithColor(context, _roundButtonColor)
        CGContextSetLineCap(context, CGLineCap.Square)
        CGContextSetLineJoin(context, CGLineJoin.Round)
        CGPathMoveToPoint(_roundPath, nil, bounds.width * 0.44, bounds.height * 0.8)
        CGPathAddLineToPoint(_roundPath, nil, bounds.width * 0.5, bounds.height * 0.4)
        CGPathAddLineToPoint(_roundPath, nil, bounds.width * 0.56, bounds.height * 0.8)
        CGContextAddPath(context, _roundPath)
        CGContextStrokePath(context)
        
        _roundButton = UIButton(frame: CGRect(x: bounds.width * 0.4, y: bounds.height * 0.2, width: bounds.width * 0.190, height: bounds.height * 0.75))
        _roundButton.backgroundColor = UIColor.clearColor()
        _roundButton.addTarget(self, action: "setJoinToRound", forControlEvents: .TouchUpInside)
        addSubview(_roundButton)
        
        CGContextSetLineWidth(context, CGFloat(15))
        CGContextSetStrokeColorWithColor(context, _bevelButtonColor)
        CGContextSetLineCap(context, CGLineCap.Square)
        CGContextSetLineJoin(context, CGLineJoin.Bevel)
        CGPathMoveToPoint(_bevelPath, nil, bounds.width * 0.765, bounds.height * 0.8)
        CGPathAddLineToPoint(_bevelPath, nil, bounds.width * 0.825, bounds.height * 0.4)
        CGPathAddLineToPoint(_bevelPath, nil, bounds.width * 0.885, bounds.height * 0.8)
        CGContextAddPath(context, _bevelPath)
        CGContextStrokePath(context)
        
        _bevelButton = UIButton(frame: CGRect(x: bounds.width * 0.72, y: bounds.height * 0.2, width: bounds.width * 0.190, height: bounds.height * 0.75))
        _bevelButton.backgroundColor = UIColor.clearColor()
        _bevelButton.addTarget(self, action: "setJoinToBevel", forControlEvents: .TouchUpInside)
        addSubview(_bevelButton)

    }
    
    func setJoinToMiter() {
        _join = CGLineJoin.Miter
        _miterButtonColor = UIColor.yellowColor().CGColor
        _roundButtonColor = UIColor.whiteColor().CGColor
        _bevelButtonColor = UIColor.whiteColor().CGColor
        print("miter changed")
        setNeedsDisplay()
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    func setJoinToRound() {
        _join = CGLineJoin.Round
        _miterButtonColor = UIColor.whiteColor().CGColor
        _roundButtonColor = UIColor.yellowColor().CGColor
        _bevelButtonColor = UIColor.whiteColor().CGColor
        print("round changed")
        setNeedsDisplay()
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    func setJoinToBevel() {
        _join = CGLineJoin.Bevel
        _miterButtonColor = UIColor.whiteColor().CGColor
        _roundButtonColor = UIColor.whiteColor().CGColor
        _bevelButtonColor = UIColor.yellowColor().CGColor
        print("bevel changed")
        setNeedsDisplay()
        sendActionsForControlEvents(UIControlEvents.ValueChanged)
    }
    
    var join: CGLineJoin { return _join! }
}
